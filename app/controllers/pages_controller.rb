class PagesController < ApplicationController

	def home
    @startups = Startup.get_active
    @homepage = Metadata.get_group 'homepage_group'
	end

  def show
    @page = Page.get_by_slug(params[:slug])
    raise ActionController::RoutingError.new('Not Found') unless @page

    render 'default'
  end

end