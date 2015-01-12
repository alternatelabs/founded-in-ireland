class PagesController < ApplicationController

	def home
    @startups = Startup.get_active
    @homepage = Metadata.get_group 'homepage_group'
	end

  def show
    @page = Page.get_by_slug(params[:slug])
    raise "Could not find page" unless @page.present?

    render 'default'
  end

end