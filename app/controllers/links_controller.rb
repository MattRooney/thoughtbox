class LinksController < ApplicationController

  def show
    @link = Link.find(params['id'])
  end

  def update
    link = Link.find(params['id'])
    @link.update(url: params['link']['url'])
    @link.update(url: params['link']['title'])
    redirect_to '/links'
  end
end
