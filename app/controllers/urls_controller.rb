class UrlsController < ApplicationController
  before_action :load_url, only: [:show]
  before_action :validates_url, only: :create
  
  def index
    urls = Url.all
    render status: :ok, json: { urls: urls }
  end

  def create
    @slug = SecureRandom.alphanumeric(6)
    @shortened_url = "http://127.0.0.1:3000/#{@slug}"
    @url = Url.new(url_params.merge(slug: @slug, shortened_url: @shortened_url))
    if @url.save
      render status: :ok, json: { notice: 'Shortened URL was successfully created' }
    else
      errors = @url.errors.full_messages
      render status: :unprocessable_entity, json: { errors: errors  }
    end
    rescue ActiveRecord::RecordNotUnique => e
      render status: :unprocessable_entity, json: { errors: e.message }
  end

  def show
    @url = Url.find_by_slug!(params[:slug])
    redirect_to @url.url
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end

  def load_url
    @url = Url.find_by_slug!(params[:slug])
    render json: {errors: errors} unless @url
    rescue ActiveRecord::RecordNotFound => errors
      render json: {errors: errors}
  end

  def validates_url
    unless (url_params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/)
      render status: :unprocessable_entity, json: { errors: t('url_error') }
    end
  end
end