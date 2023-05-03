# frozen_string_literal: true
require "microsoft_kiota_serialization_json"
require "microsoft_kiota_abstractions"
require "microsoft_kiota_faraday"
require_relative "./blog/blog_client"
require_relative "./AnonymousAuthenticationProvider"

auth_provider = AnonymousAuthenticationProvider.new()

request_adapter =
  MicrosoftKiotaFaraday::FaradayRequestAdapter.new(auth_provider)

client = Blog::BlogClient.new(request_adapter)

posts = client.posts.get.resume

posts.value.each { |post| puts "The Post ##{post.id} has Title: #{post.title}" }
