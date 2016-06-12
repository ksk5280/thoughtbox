module Api
  module V1
    class LinksController < ApiController
      def index
        respond_with Link.all
      end

      def show
        respond_with Link.find(params[:id])
      end

      def update
        link = Link.find(params[:id])
        respond_with link.update(link_params)
      end

      private
        def link_params
          params.permit("read", "url", "title")
        end
    end
  end
end
