class LinksController < ApplicationController
  def index
    if current_user.nil?
      redirect_to root_path
    else
      @link = Link.new
      @links = Link.all
    end
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      flash[:success] = "Link saved!"
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
