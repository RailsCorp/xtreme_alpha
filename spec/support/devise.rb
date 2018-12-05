require "rspec/rails"
module Devise
  def auth_headers
    {
      "access-token": "lhG-DTB64dyOlv1e-6BAiQ",
      "client": "RqCpylnDWcDUQVntAbpyDw",
      "uid": "admin1@example.com"
    }
  end
end
