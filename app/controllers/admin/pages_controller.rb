module Admin
  class PagesController < BaseController
    before_action :set_page, only: [:edit, :update, :destroy]

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.create(page_params)

      if @page.save
        redirect_to admin_pages_path, notice: "New page has been created"
      else
        flash[:error] = "There were some errors creating the page"
        render :new
      end
    end

    def edit
    end

    def update
      if @page.update(page_params)
        redirect_to admin_pages_path, notice: "Page has been updated"
      else
        flash[:error] = "There were some errors updating the page"
        render :edit
      end
    end

    private

      def set_page
        @page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:title, :slug, :content)
      end

  end
end