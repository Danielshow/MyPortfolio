# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include SetSource
  include DeviseWhitelist
  include CurrentUserConcern
  include DefaultPageContent

    private

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
