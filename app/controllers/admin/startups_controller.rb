module Admin
  class StartupsController < BaseController

    def index
      @startups = Startup.all
    end

    def edit
      @startup = Startup.find(params[:id])
    end

  end
end