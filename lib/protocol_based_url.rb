require 'uri'

module Url
    class ProtocolBasedUrl
        def initialize(url, protocols)
            @url = url
            @protocols = protocols
        end

        def to_s
            return @url if supported?
            raise Exception,
                format(
                    'Protocol of the URL %{url} must be one of %{protocols}',
                    url: @url,
                    protocols: readable_protocols
                )
        end

        def supported?
            @protocols.map(&:downcase).include?(protocol)
        end

        def protocol
            URI(@url).scheme
        end

        def readable_protocols
            filled_protocols = @protocols.reject(&:empty?)
            readable_protocols = filled_protocols.join(', ')
            return format(
                '%{protocols} or left empty',
                protocols: readable_protocols
            ) if filled_protocols != @protocols
            return readable_protocols
        end

        private :supported?, :protocol, :readable_protocols
    end
end
