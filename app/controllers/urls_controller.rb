class UrlsController < ApplicationController
  def index
    urls = URL.all
    render status: :ok, json: { urls: urls }
  end

  def create
    @url = URL.new(url_params)
    if @url.save
      render status: :ok, json: { notice: 'URL was successfully created' }
    else
      errors = @url.errors.full_messages
      render status: :unprocessable_entity, json: { errors: errors  }
    end
  rescue ActiveRecord::RecordNotUnique => e
    render status: :unprocessable_entity, json: { errors: e.message }
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end
end