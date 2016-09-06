require 'net/http'

module Url
    class ReachableUrl
        def initialize(url)
            @url = url
        end

        def to_s
            return @url if reachable?
            raise Exception, "The given URL #{@url} is not reachable"
        end

        def reachable?
            url = URI.parse(@url)
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = (url.scheme == 'https')
            path = url.path unless url.path.empty?
            response = http.request_head(path || '/')
            if response.kind_of?(Net::HTTPRedirection)
                reachable?(response['location']) 
            else
                response.code != 404
            end
        rescue
            false
        end

        private :reachable?
    end
end
