# frozen_string_literal: true

module Public
  # Themes controller
  class ThemesController < ApplicationController
    before_action :set_theme, only: %i[show]
    protect_from_forgery with: :null_session if Rails.env.test?
    protect_from_forgery with: :null_session

    # POST /themes/:id
    # Return a list of events for a given theme and players
    def show
      if @theme.nil?
        render json: {
          "status": 'error',
          "message": 'Theme not found'
        }, status: :not_found
        return
      end

      params = theme_params
      players = params[:players]
      if players.nil?
        render json: {
          status: 'error',
          message: 'Players must be provided.'
        }, status: :unprocessable_entity
        return
      end

      # Check if players are unique
      if players.uniq.length != players.length
        render json: {
          status: 'error',
          message: 'Players must be unique.'
        }, status: :unprocessable_entity
        return
      end

      # Check if there are enough players
      if players.length <= 2
        render json: {
          status: 'error',
          message: 'Players must be at least 3 to play.'
        }, status: :unprocessable_entity
        return
      end

      render json: {
        status: 'success',
        events: Core::Themes::ThemeGenerator.generate(@theme, players)
      }
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find_by(id: params[:id])
    end

    def theme_params
      params.permit(:id, players: [])
    end
  end
end
