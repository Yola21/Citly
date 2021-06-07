require("test_helper")

class UrlTest < ActiveSupport::TestCase
  def setup
    Url.delete_all
    @url = Url.new(url: 'https://www.amazon.com',
                  shortened_url: 'http://cit.ly/Af1d3H',
                  slug: 'Af1d3H',)
  end

  def test_instance_of_url
    assert_instance_of Url, @url
  end

  def test_value_of_url_assigned
    assert_equal "https://www.amazon.com", @url.url
  end

  def test_value_created_at
    assert_nil @url.created_at
    @url.save!
    assert_not_nil @url.created_at
  end

  test "error raised" do
    assert_raises ActiveRecord::RecordNotFound do
      Url.find(SecureRandom.alphanumeric)
    end
  end
  
  def test_count_of_number_of_urls
    assert_difference ['Url.count'], 2 do
      Url.create!(url: 'https://www.amazon.com',
                  shortened_url: 'http://cit.ly/A5f5aJ',
                  slug: 'A5f5aJ',)
      Url.create!(url: 'https://www.quora.com',
                  shortened_url: 'http://cit.ly/g5f8Y6',
                  slug: 'g5f8Y6',)
    end
  end

  def test_url_should_not_be_valid_without_url
    @url.url = ''
    assert @url.invalid?
  end

  def test_url_should_not_be_valid_without_shortened_url
    @url.shortened_url = ''
    assert @url.invalid?
  end

  def test_url_should_not_be_valid_without_slug
    @url.slug = ''
    assert @url.invalid?
  end

  def test_slug_to_be_reused_after_getting_deleted
    test_url = Url.create!(url: 'https://www.twitter.com',
                            shortened_url: 'http://cit.ly/1g6d9t',
                            slug: '1g6d9t')
  
    test_url_slug = test_url.slug
    test_url.destroy
  
    assert_nothing_raised do
      Url.create!(url: 'https://www.facebook.com',
                   shortened_url: "http://cit.ly/#{test_url_slug}",
                   slug: test_url_slug)
    end
  end

  def test_validation_should_accept_valid_urls
    valid_urls = %w[https://example.com http://example.COM 
                    https://US-ER.example.org http://first.example.in?a=4]
  
    valid_urls.each do |url|
      @url.url = url
      assert @url.valid?
    end
  end

  def test_validation_should_accept_valid_shortened_urls
    valid_urls = %w[https://example.com/1234a http://example.COM/3452s 
                    https://US-ER.example.org/4567g http://example.in/6789g]
  
    valid_urls.each do |url|
      @url.shortened_url = url
      assert @url.valid?
    end
  end
end