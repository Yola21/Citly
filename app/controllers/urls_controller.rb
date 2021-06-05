class UrlsController < ApplicationController
  # before_action :load_url, only: :index
  before_action :set_slug, :set_shortened_url, only: :create
  
  def index
    urls = Url.all
    render status: :ok, json: { urls: urls }
  end

  def create
    @url = Url.new(url_params.merge(slug: @slug, shortened_url: @shortened_url))
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

  # def load_url
  #   @url = URL.find_by_slug!(params[:slug])
  #   rescue ActiveRecord::RecordNotFound => errors
  #     render json: {errors: errors}
  # end

  def set_slug
    @slug = SecureRandom.alphanumeric(6)
    # @temp_url = URL.find_by_slug!(params[:slug])
    # set_slug() if @temp_url
  end

  def set_shortened_url
    @shortened_url = "localhost:3000/#{@slug}"
  end
end