class UrlsController < ApplicationController
  def index
    urls = URL.all
    render status: :ok, json: { urls: urls }
  end
end