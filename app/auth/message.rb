class Message
  class << self 
    def invalid_token
      "Invalid Token"
    end
  
    def invalid_credentials
      "Invalid Credentials"
    end
  
    def missing_token
      "Missing Token"
    end
  end
end