# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # module Workspaces
    def workspaces_build_tabs(&block)
      current_user.settings[:workspaces].tap do |workspaces|
        return if workspaces.nil?
        workspaces.each do |workspace|
          yield workspace
        end
      end
    end
  # end

  # truncate when the length of `text` is greater that `options[:length]` by 2 or more characters
  def awesome_truncate(text, *args)
    return if text.nil?
    options = args.extract_options!.reverse_merge(:length => 15)
    (text.size - options[:length] > 1) ? "#{text[0, options[:length]]}..." : text
  end

  def link_with_avatar(resource)
    klass = (resource.is_a?(Party)) ? resource.type : resource.class
    link_to image_tag("/images/avatars/#{klass.to_s.downcase}.png", :size => "56x56"), resource
  end

  def link_to_delete(label, record, *args)
    options = args.extract_options!
    # :require_rank_after permite al usuario eliminar su propio registro durante los primeros minutos de su creacion
    # *es necesario que este presente :rank_required*
    if options[:rank_required].present?
      action_allowed = current_user.is_at_least?(options[:rank_required]) || nil
      action_allowed ||= record.creator == current_user && record.created_at > options[:require_rank_after].ago unless options[:require_rank_after].nil?
      return unless action_allowed
    end

    link_to "<span>#{label}</span>", record, :confirm => "¿Estas seguro?", :method => :delete, :class => "delete s16-delete"
  end

  def auto_link_app(content)
    [{:match => /(#[a-z_]+)/, :path => messages_path(:q => '')},
     {:match => /(S[1-9][0-9]+)/i, :path => search_path(:q => '')},
     {:match => /([A-Z]{2,3}\-[0-9][0-9]{1,3})(?=[,\s])/, :path => cva_path},
    ].each do |match_path|
      content.gsub!(match_path[:match]) do |match|
        link_to match, match_path[:path] + CGI::escape(match)
      end
    end
    content
  end

  # push notifications
  def render_notification(type, &block)

  end

  def render_notification_if(condition, type, &block)

  end

  def cva_path(clave = '')
    "https://www.grupocva.com/me_bpm/Cotizaciones/ListaPrecioswcCotizacion.php?fMarca=%25&fGrupo=%25&fOrden=2&fClave=#{clave}"
  end

end
