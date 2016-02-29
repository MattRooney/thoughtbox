class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "#{@link.title} was added!"
      redirect_to links_path
    else
      flash.now[:error] = "Something went wrong. Please make sure the url is valid."
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
