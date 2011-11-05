module HuesosHelper

  def content_for?(name)
    instance_variable_get("@content_for_#{name}").present?
  end

  def render_menu_item(nav_id_or_path, name, path = nil, options = {}, &block)
    (c ||= []) << nav_id_or_path.to_s
    c << "first-child" if options[:first_child]
    c << "last-child" if options[:last_child]
    c << "current" if current_menu_is?(nav_id_or_path)
    item = %{<li class="menu_item #{c.join(' ')}"><a href="#{path || "#"}" class="menu_item">#{name}</a>#{options[:separator] || ''}#{capture(&block) if block_given?}</li>}
    block_given? ? concat(item) : item
  end

  def current_menu_is?(nav_id_or_path)
    @meta["navigation"].present? && @meta["navigation"].to_s.match(/^#{nav_id_or_path.to_s}/).present?
  end

  def discreet(content, *args)
    options = args.extract_options!.reverse_merge(:class => 'discreet')
    content_tag('span', content, options) unless content.blank?
  end

  def convert_tabs_to_spaces(text)
    start_at = (text.strip![/^(\s+)/] || []).length - 1
    text.map do |line|
      line.sub!(/^(\s+)/) { |c| '  ' * [c.length - start_at, 0].max }
      line.sub!(/(\s+)$/, "\n")
      line
    end
  end

  def code_tag(&block)
    concat(content_tag(:pre, :class => "code") do
      convert_tabs_to_spaces h(capture(&block).to_s)
    end)
	end

  # UI
  def banner_tag(path, url = nil, *args)
    options = args.extract_options!
    content_tag :div, :class => "banner_image" do
      link_to(image_tag(path, :alt => options[:alt]), url)
    end
  end

  # UI
  def button_tag(name, href, options = {})
    options[:class] = ["button", (options[:class] ||= "green")].join(" ")
    link_to(content_tag(:span, name), href, options)
  end

  # UI
	def title_tag(title, *args)
	  options = args.extract_options!.reverse_merge(:h => "3", :regular_output => true)
    container_tag(options) do
      content_tag("h#{options[:h]}".to_sym, :class => options[:class]) { title }
    end
	end

  # UI
  def frame_tag(klass = "", &block)
    return unless block_given?
    klass = "frame_#{klass}" if klass.present?
    concat(content_tag(:div, :class => ["frame", klass].join(" ")) do
      content_tag :div, :class => "inner" do
         capture(&block)
      end
    end)
  end

  # UI
	def container_tag(*args, &block)
	  options = args.extract_options!.reverse_merge(:size => "32x32")
	  html = content_tag :table, :class => "container #{options[:class]}".strip, :cellspacing => "0", :cellpadding => "0" do
	    content_tag :tr do
        (content_tag :td, :class => "image" do
          image_tag(options[:img], :size => options[:size]) unless options[:img].blank?
        end) +
        (content_tag :td do
          capture(&block)
        end)
	    end
	  end
	  options[:regular_output] ? html : concat(html)
	end
	
	# UI
	def ver_mas_tag(href, options = {})
    button_tag "Ver más »", href, :class => "#{options[:class] ||= "green small"}"
  end
  
  # UI
  def mas_informacion_tag(href, options = {})
    button_tag "Más información »", href, :class => "#{options[:class] ||= "green"}"
  end

end