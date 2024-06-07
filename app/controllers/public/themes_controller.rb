class Public::ThemesController < ApplicationController
  before_action :ensure_json_request  
  before_action :set_theme, only: %i[ show ]

  # GET /themes/1 or /themes/1.json
  def show
    if @theme.nil?
      render json: {
        "status": "error",
        "message": "Theme not found"
      }
    else
      render json: {
        "status": "success",
        "questions": @theme.questions.map(&:build)
      }
    end
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
end
