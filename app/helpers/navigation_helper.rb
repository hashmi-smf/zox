module NavigationHelper
  def icon(i)
    i = "icon-#{i}" unless i =~ /^icon/
    content_tag(:i, "", class: i)
  end


  def icon_link_to(text, url = '#', options = {})
    options[:class] ||= 'btn-default'
    options[:class] += ' btn'
    icon_name = options.delete(:icon)
    link_to(url, options) do
      concat(icon(icon_name)) if icon_name
      concat(" #{text}")
    end
  end

  def secondary_link_to(text, url = '#', options = {})
    content_for :secondary_nav do
      icon_link_to(text, url, options)
    end
  end

  def nav_node(text, path = '#', options = {})
    return content_tag(:li, nil, class: 'divider') if text == :divider
    if path.is_a?(Proc)
      path = path.call()
      return if path === false
    end
    css_class = (path == '/' ? request.fullpath == '/'  : request.fullpath =~ /^#{path}$/) ? 'active' : ''
    link_text = if icon = options.delete(:icon)
                  "<i class='icon-#{icon}'></i> #{text}"
                else
                  text
                end
    content = link_to(raw(link_text), path, options)
    content_tag :li, raw(content), class: css_class
  end

  def current_nav_links
    navlinks[(current_user.try(:role) || :anon).to_sym]
  end

  def navlinks
    @navlinks ||= {
      admin: {
        'Home'       => root_path,
        'Events'     => events_path,
        'Leads'      => leads_path,
        'Sites'      => sites_path
        

      },
      customer: {
        'Home'      => root_path,
      },
      anon: {
        'Home'      => root_path,
        'Events'    => events_path
      },
    }
  end

end