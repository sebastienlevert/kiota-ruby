require 'microsoft_kiota_abstractions'
require 'microsoft_kiota_serialization_json'
require_relative './blog'
require_relative './posts/posts_request_builder'

module Blog
    ## 
    # The main entry point of the SDK, exposes the configuration and the fluent API.
    class BlogClient < MicrosoftKiotaAbstractions::BaseRequestBuilder
        
        ## 
        # The posts property
        def posts()
            return Blog::Posts::PostsRequestBuilder.new(@path_parameters, @request_adapter)
        end
        ## 
        ## Instantiates a new BlogClient and sets the default values.
        ## @param request_adapter The request adapter to use to execute the requests.
        ## @return a void
        ## 
        def initialize(request_adapter)
            super(Hash.new, request_adapter, "{+baseurl}")
            MicrosoftKiotaAbstractions::ApiClientBuilder.register_default_serializer(MicrosoftKiotaSerializationJson::JsonSerializationWriterFactory)
            MicrosoftKiotaAbstractions::ApiClientBuilder.register_default_deserializer(MicrosoftKiotaSerializationJson::JsonParseNodeFactory)
            if @request_adapter.get_base_url.nil? || @request_adapter.get_base_url.empty?
                @request_adapter.set_base_url('http://my-json-server.typicode.com/sebastienlevert/kiota-api')
            end
            @path_parameters['baseurl'] = @request_adapter.get_base_url
        end
    end
end
