# frozen_string_literal: true

module Public
  # Homepage controller
  class HomeController < PublicController
    def index
      @themes = Theme.all
    end
  end
end
