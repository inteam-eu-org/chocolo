class Public::HomeController < PublicController
  def index
    @themes = Theme.all
  end
end