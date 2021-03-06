class UrlsController < ApplicationController
  before_action :load_url, only: :show
  before_action :validates_url, :check_uniqueness_of_url, only: :create
  before_action :load_updated_url, only: :update
  
  def index
    urls = Url.all
    render status: :ok, json: { urls: urls.organize() }
  end

  def create
    @slug = SecureRandom.alphanumeric(6)
    @shortened_url = "http://cit.ly/#{@slug}"
    @url = Url.new(url_params.merge(slug: @slug, shortened_url: @shortened_url))
    if @url.save
      render status: :ok, json: { notice: 'Shortened URL is ready!' }
    else
      errors = @url.errors.full_messages
      render status: :unprocessable_entity, json: { errors: errors  }
    end
    rescue ActiveRecord::RecordNotUnique => e
      render status: :unprocessable_entity, json: { errors: e.message }
  end

  def show
    @url = Url.find_by_slug!(params[:slug])
  end

  def update
    if @url.update(url_params)
      render status: :ok, json: { message: 'URL has been pinned!' }
    else
      render status: :unprocessable_entity,
      json: { error: @url.errors.full_messages.to_sentence }
    end
  end

  private

  def url_params
    params.require(:url).permit(:url, :number_of_clicks, :status)
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

  def load_updated_url
    @url = Url.find_by_slug!(params[:slug])
    rescue ActiveRecord::RecordNotFound => errors
      render json: {errors: errors}
  end

  def check_uniqueness_of_url
    url = Url.find_by(url: url_params[:url])
    if url
      render status: :unprocessable_entity, json: { info: t('url_already_exist') }
    end
  end
end