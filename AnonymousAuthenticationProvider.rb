class AnonymousAuthenticationProvider
  include MicrosoftKiotaAbstractions::AuthenticationProvider
  def authenticate_request(request)
    Fiber.new do 
    end
  end
end