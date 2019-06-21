# frozen_string_literal: true

# Application helper
module ApplicationHelper
  def login_helper(style = 'link')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style.to_s) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style.to_s)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style.to_s
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
