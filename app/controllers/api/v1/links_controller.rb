module Api
  module V1
    class LinksController < ApiController
      def index
        respond_with Link.all
      end
    end
  end
end
