# frozen_string_literal: true

# Application helper
module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Register', new_user_registration_path) +
        '<br>'.html_safe +
        (link_to 'Login', new_user_session_path)
    end
  end

  def source_helper
    source = session[:source]
    greeting = "Thanks for visiting me from #{source}"
    content_tag(:p, greeting, class: 'source-greeting') if source
  end

  def copyright_generator
    ShowViewTool::Renderer.copyright('Daniel Shotonwa', 'All right reserved')
  end
end
