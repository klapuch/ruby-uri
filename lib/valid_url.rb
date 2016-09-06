module Url
    class ValidUrl
        def initialize(url)
            @url = url
        end

        def to_s
            return @url if valid?
            raise Exception, "The given URL #{@url} is not valid"
        end

        def valid?
            @url =~ URI::regexp
        end

        private :valid?
    end
end
