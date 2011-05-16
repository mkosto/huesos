module DispatcherHelper

  def next_option(options, current = nil, &block)
    options = options.split("|") if options.is_a?(String)
    current ||= options.last
    if indx = options.index(current)
      option = options.at(indx + 1 < options.size ? indx + 1 : 0)
      block_given? ? yield(option) : option
    end
  end

  def build_block_marcas(template, options = {})
    APP_CONFIG[:dispatcher]['marcas'].collect do |marca|
      if options[:href].present?
        link_to(template.gsub(/\{marca\}/, marca), options[:href].gsub('{marca}', marca))
      else
        template.gsub(/\{marca\}/, marca)
      end
    end.compact.join " | "
  end

  def build_link_marca(template, *args)
    options = args.extract_options!.reverse_merge(:builder => :link_to)
    next_option(APP_CONFIG[:dispatcher]['marcas'], args.shift) do |marca|      
      send options[:builder], template.gsub(/\{marca\}/, marca), options[:href].gsub('{marca}', marca)
    end
  end

end
