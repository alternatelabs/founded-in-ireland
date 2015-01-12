module Admin
  class HomepageController < BaseController

    def index
      @homepage = {};
      fields.each do |field|
        @homepage[field] = Metadata.get(field)
      end
    end

    def update
      @fields = {}
      fields.each do |field|
        Metadata.set(field, params.permit(field).first[1])
      end

      redirect_to admin_homepage_edit_path, notice: 'Homepage content has been updated'
    end

    private

      def fields
        ['homepage_header_content', 'homepage_footer_content']
      end

  end
end