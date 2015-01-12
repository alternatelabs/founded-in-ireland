class PagesController < ApplicationController

	def home
    @startups = Startup.get_active
	end

end