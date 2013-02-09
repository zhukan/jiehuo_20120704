#coding: utf-8
module ApplicationHelper
  def use_yahei_font?(ua)
    unless ua
      return true
    end

    use = true

    ["Windows NT 5.2", "Windows NT 5.1"].each do |w|
      if ua.include?(w)
        use = false
        break
      end
    end
    return use
  end

  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, notice, :class => "notice") if notice
    msg << (content_tag :div, alert, :class => "alert") if alert
    sanitize msg
  end

  def local_devise_error_messages!
    return "" if resource.nil?|| resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    if (messages == "<li>Email has already been taken</li>")
      messages ="<li>该邮件已被注册!</li>"
    end
    html = <<-HTML
    <div id="error_explanation">
      <ul >#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def current_user_name
      current_user.name
  end

  def jiehuo_simple_format(text, html_options={}, options={})
    text = '' if text.nil?
    start_tag = tag('p', html_options, true)
    text = sanitize(text) unless options[:sanitize] == false
    text = text.to_str
    text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
    text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")  # 2+ newline  -> paragraph
    text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
    text.html_safe
  end


end
