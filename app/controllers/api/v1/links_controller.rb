class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    respond_with Link.all
  end

  def show
    respond_with Link.find(params[:id])
  end

  def create
    link = Link.new(link_params)
    if link.save
      respond_with(link, status: 201, location: api_v1_link_path(link))
    else
      render json: { errors: link.errors }, status: 422, location: api_v1_links_path
    end
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      respond_with(link, status: 200, location: api_v1_link_path(link))
    else
      render json: link.errors, status: 422
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    head :no_content
  end

  private

  def link_params
    params.permit(:link, :url, :title)
  end

end