module HuesosHelper

  def meta(name)
    @meta[name] rescue nil
  end

  def content_for?(name)
    instance_variable_get("@content_for_#{name}").present?
  end

	def time_ago_abbr(date)
	 content_tag :abbr, distance_of_time_in_words_to_now(date), :title => date.to_s(:alpha)
	end
  
  def render_menu_item(nav_id_or_path, name, path = nil, options = {})
    (klasses ||= []) << nav_id_or_path.to_s
    klasses << "first-child" if options[:first_child]
    klasses << "current" if current_menu_is?(nav_id_or_path)
  	%{<li class="#{klasses.join(' ')}"><a href="#{path || "#"}">#{name}</a>#{options[:separator] || ''}</li>}
  end
  
  def current_menu_is?(nav_id_or_path)
    @meta[:navigation].present? && @meta[:navigation].to_s.match(/^#{nav_id_or_path}/).present?
  end
  
  def render_flash_messages
    return unless messages = flash.keys.select { |k| [:error, :notice, :warning].include? k }
    messages.map do |type|
      content_tag :div, :class => "flash_message #{type.to_s}" do
        "<p>#{flash[type.to_sym]}</p>"
      end
    end.join
  end

  def print_once(content, *args)
    @_print_once ||= {}
    options = args.extract_options!.reverse_merge(:key => '_default')
    content if @_print_once[options[:key].to_sym].nil? && @_print_once[options[:key].to_sym] ||= true
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
    concat CodeRay.scan(convert_tabs_to_spaces(capture(&block)), :rhtml).div(:css => :class)
	end

  def header_image_tag(path, *args)
    options = args.extract_options!
    content_tag :div, :class => "image" do
      image_tag path, :alt => options[:alt], :height => "300"
    end
  end

  def button_tag(name, href, options = {})
    options[:class] = ["button", (options[:class] ||= "green")].join(" ")
    link_to(name, href, options) + content_tag(:div, "", :class => "clearfix")
  end

  def frame_tag(klass = "", &block)
    return unless block_given?
    klass = "frame_#{klass}" if klass.present?
    concat(content_tag(:div, :class => ["frame", klass].join(" ")) do
      content_tag :div, :class => "inner" do
         capture(&block)
      end
    end)
  end

	def title_tag(title, *args)
	  options = args.extract_options!.reverse_merge(:h => "3", :regular_output => true)
    container_tag(options) do
      content_tag("h#{options[:h]}".to_sym, :class => options[:class]) { title }
    end
	end

	def container_tag(*args, &block)
	  options = args.extract_options!.reverse_merge(:size => "32x32")
	  html = content_tag :table, :class => "container", :cellspacing => "0", :cellpadding => "0" do
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

end