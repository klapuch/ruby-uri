require 'test_helper'
require 'protocol_based_url'

class ProtocolBasedUrlTest < Minitest::Test
    def test_url_with_allowed_protocol
        url = Url::ProtocolBasedUrl.new(
            'https://www.google.com',
            ['http', 'https']
        )
        assert_equal(url.to_s, 'https://www.google.com')
    end

    def test_url_with_allowed_upper_case_protocols
        url = Url::ProtocolBasedUrl.new(
            'https://www.google.com',
            ['http', 'HTTPS']
        )
        assert_equal(url.to_s, 'https://www.google.com')
    end


    def test_url_with_not_supported_protocols
        exception = assert_raises Exception do
            url = Url::ProtocolBasedUrl.new(
                'ftp://www.google.com',
                ['http', 'https']
            )
            url.to_s
        end
        assert_equal(
            exception.to_s,
            'Protocol of the URL ftp://www.google.com must be one of http, https'
        )
    end

    def test_url_with_not_supported_protocols_with_empty_one
        exception = assert_raises Exception do
            url = Url::ProtocolBasedUrl.new(
                'ftp://www.google.com',
                ['http', 'https', '']
            )
            url.to_s
        end
        assert_equal(
            exception.to_s,
            'Protocol of the URL ftp://www.google.com must be one of http, https or left empty'
        )
    end

end
