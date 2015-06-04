module ApplicationHelper

  def normalized_controller_name
    params[:controller].gsub(/\//,'-')
  end
  
	  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)
  
  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :warning  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg, :class => "alert fade in alert-#{type} #{options[:class]}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
  
  def ist(time)
    time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
  end
end
