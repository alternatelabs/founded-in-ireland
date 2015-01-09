module Admin
  class StartupsController < BaseController
    before_action :set_startup, only: [:edit, :update, :destroy]

    def index
      @startups = Startup.all
    end

    def edit
    end

    def update
      if @startup.update(startup_params)
        redirect_to admin_startups_path, notice: 'Startup was updated'
      else
        render :edit
      end
    end

    def destroy
    end

    private

    def set_startup
      @startup = Startup.find(params[:id])
    end

    def startup_params
      params.require(:startup).permit(:name, :year_founded, :location, :description, :url, :twitter, :uploaded_logo, :status)
    end

  end
end