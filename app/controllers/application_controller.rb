# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include SetSource
  include DeviseWhitelist
  include CurrentUserConcern
end
