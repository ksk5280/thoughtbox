class LinksController < ApplicationController
  def index
    if current_user.nil?
      redirect_to root_path
    else
      @link = Link.new
      @links = current_user.links.all
    end
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      flash.now[:success] = "Link saved!"
      render "index"
    else
      flash.now[:danger] = @link.errors.full_messages.join(', ')
      render "index"
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
