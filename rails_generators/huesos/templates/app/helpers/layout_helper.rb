module LayoutHelper
  
  def include_section_stylesheet
    stylesheet_link_tag controller.controller_name.downcase
  end

  def discreet(content, *args)
    options = args.extract_options!.reverse_merge(:class => 'discreet')
    content_tag('span', content, options) unless content.blank?
  end

  def content_for?(name)
    instance_variable_get("@content_for_#{name}").present?
  end

	def time_ago_abbr(date)
	 content_tag :abbr, distance_of_time_in_words_to_now(date), :title => date.to_s(:alpha)
	end

  def toggle_visibility_of(field, options)
    observe_field(options[:trigger], :function => " $('#{field}').toggle(#{options[:if]}); ")
  end

  def render_flash_messages
    return unless messages = flash.keys.select { |k| [:error, :notice, :warning].include? k }
    formatted_messages = messages.map do |type|
      content_tag :div, :class => "flash_message #{type.to_s}" do
        "<p>#{flash[type.to_sym]}</p>"
      end
    end
    formatted_messages.join
  end

  def print_once(content, *args)
    @_print_once ||= {}
    options = args.extract_options!.reverse_merge(:key => '_default')
    content if @_print_once[options[:key].to_sym].nil? && @_print_once[options[:key].to_sym] ||= true
  end

end