require 'microsoft_kiota_abstractions'
require_relative '../blog'
require_relative './models'

module Blog
    module Models
        class PostList
            include MicrosoftKiotaAbstractions::Parsable
            ## 
            # The value property
            @value
            ## 
            ## Creates a new instance of the appropriate class based on discriminator value
            ## @param parse_node The parse node to use to read the discriminator value and create the object
            ## @return a post_list
            ## 
            def self.create_from_discriminator_value(parse_node)
                raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                return PostList.new
            end
            ## 
            ## The deserialization information for the current model
            ## @return a i_dictionary
            ## 
            def get_field_deserializers()
                return {
                    "value" => lambda {|n| @value = n.get_collection_of_object_values(lambda {|pn| Blog::Models::Post.create_from_discriminator_value(pn) }) },
                }
            end
            ## 
            ## Serializes information the current object
            ## @param writer Serialization writer to use to serialize this model
            ## @return a void
            ## 
            def serialize(writer)
                raise StandardError, 'writer cannot be null' if writer.nil?
                writer.write_collection_of_object_values("value", @value)
            end
            ## 
            ## Gets the value property value. The value property
            ## @return a post
            ## 
            def value
                return @value
            end
            ## 
            ## Sets the value property value. The value property
            ## @param value Value to set for the value property.
            ## @return a void
            ## 
            def value=(value)
                @value = value
            end
        end
    end
end
