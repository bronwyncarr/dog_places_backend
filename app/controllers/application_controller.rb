# frozen_string_literal: true

class ApplicationController < ActionController::API
  # good 'ol knock for auth
  include Knock::Authenticable
  
end
