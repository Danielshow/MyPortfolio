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

  def strip_body(body, number)
    body[0...number]
  end

  def add_alert(alert, css)
    ("<div class='alert #{css} alert-dismissible fade show' role='alert'>
      <strong>#{alert}</strong>
      <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
        <span aria-hidden='true'>&times;</span>
      </button>
    </div>").html_safe
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links += "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
