require 'microsoft_kiota_abstractions'
require_relative '../blog'
require_relative './models'

module Blog
    module Models
        class Post
            include MicrosoftKiotaAbstractions::Parsable
            ## 
            # The body property
            @body
            ## 
            # The id property
            @id
            ## 
            # The title property
            @title
            ## 
            # The userId property
            @user_id
            ## 
            ## Gets the body property value. The body property
            ## @return a string
            ## 
            def body
                return @body
            end
            ## 
            ## Sets the body property value. The body property
            ## @param value Value to set for the body property.
            ## @return a void
            ## 
            def body=(value)
                @body = value
            end
            ## 
            ## Creates a new instance of the appropriate class based on discriminator value
            ## @param parse_node The parse node to use to read the discriminator value and create the object
            ## @return a post
            ## 
            def self.create_from_discriminator_value(parse_node)
                raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                return Post.new
            end
            ## 
            ## The deserialization information for the current model
            ## @return a i_dictionary
            ## 
            def get_field_deserializers()
                return {
                    "body" => lambda {|n| @body = n.get_string_value() },
                    "id" => lambda {|n| @id = n.get_number_value() },
                    "title" => lambda {|n| @title = n.get_string_value() },
                    "userId" => lambda {|n| @user_id = n.get_number_value() },
                }
            end
            ## 
            ## Gets the id property value. The id property
            ## @return a integer
            ## 
            def id
                return @id
            end
            ## 
            ## Sets the id property value. The id property
            ## @param value Value to set for the id property.
            ## @return a void
            ## 
            def id=(value)
                @id = value
            end
            ## 
            ## Serializes information the current object
            ## @param writer Serialization writer to use to serialize this model
            ## @return a void
            ## 
            def serialize(writer)
                raise StandardError, 'writer cannot be null' if writer.nil?
                writer.write_string_value("body", @body)
                writer.write_number_value("id", @id)
                writer.write_string_value("title", @title)
                writer.write_number_value("userId", @user_id)
            end
            ## 
            ## Gets the title property value. The title property
            ## @return a string
            ## 
            def title
                return @title
            end
            ## 
            ## Sets the title property value. The title property
            ## @param value Value to set for the title property.
            ## @return a void
            ## 
            def title=(value)
                @title = value
            end
            ## 
            ## Gets the userId property value. The userId property
            ## @return a integer
            ## 
            def user_id
                return @user_id
            end
            ## 
            ## Sets the userId property value. The userId property
            ## @param value Value to set for the user_id property.
            ## @return a void
            ## 
            def user_id=(value)
                @user_id = value
            end
        end
    end
end
