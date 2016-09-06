require 'test_helper'
require 'valid_url'

class ValidUrlTest < Minitest::Test
    def test_valid_url
        url = Url::ValidUrl.new 'https://www.google.com'
        assert_equal(url.to_s, 'https://www.google.com')
    end

    def test_invalid_url_with_error
        exception = assert_raises Exception do
            url = Url::ValidUrl.new 'nonsense'
            url.to_s
        end
        assert_equal(exception.to_s, 'The given URL nonsense is not valid')
    end
end
