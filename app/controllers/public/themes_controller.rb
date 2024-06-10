class Public::ThemesController < ApplicationController
  before_action :ensure_json_request  
  before_action :set_theme, only: %i[ show ]

  # POST /themes/1
  def show
    if @theme.nil?
      render json: {
        "status": "error",
        "message": "Theme not found"
      }
      return
    end

    params = theme_params
    players = params[:players]

    # Check if players are unique
    if players.uniq.length != players.length
      render json: {
        "status": "error",
        "message": "Players must be unique."
      }
      return;
    end

    # Check if there are enough players
    if players.length <= 2
      render json: {
        "status": "error",
        "message": "Players must be at least 3 to play."
      }
      return;
    end

    render json: {
      "status": "success",
      "events": Core::Themes::ThemeGenerator.generate(@theme, players)
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow json requests
    def ensure_json_request  
      return if request.format == :json
      render :nothing => true, :status => 406
    end

    def theme_params
      params.permit(:id, players: [])
    end
end
