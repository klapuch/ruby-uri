require 'test_helper'
require 'reachable_url'

class ReachableUrlTest < Minitest::Test
    def test_reachable_http_url
        url = Url::ReachableUrl.new('http://www.example.com')
        assert_equal('http://www.example.com', url.to_s)
    end

    def test_reachable_https_url
        url = Url::ReachableUrl.new('https://nette.org/')
        assert_equal('https://nette.org/', url.to_s)
    end
    
    #TODO
    #def test_reachable_url_with_redirect
    #    url = Url::ReachableUrl.new('https://www.nette.org/')
    #    assert_equal('https://www.nette.org/', url.to_s)
    #end

    def test_unknown_url
        exception = assert_raises Exception do
            url = Url::ReachableUrl.new('http://www.foobar.se')
            url.to_s
        end
        assert_equal(
            exception.to_s,
            'The given URL http://www.foobar.se is not reachable'
        )
    end

end
