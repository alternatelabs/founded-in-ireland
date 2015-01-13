module Admin
  class HomepageController < BaseController

    def index
      @homepage = Metadata.get_group 'homepage_group'
    end

    def update
      Metadata.set_group 'homepage_group', params
      redirect_to admin_homepage_edit_path, notice: 'Homepage content has been updated'
    end

  end
end