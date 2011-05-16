module LayoutHelper
  
  def ver_mas_tag(href, options = {})
    button_tag "Ver más »", href, :class => "button #{options[:class] ||= "green small"}"
  end

  def mas_informacion_tag(href, options = {})
    button_tag "Más información »", href, :class => "button #{options[:class] ||= "green"}"
  end
  
  def telefono_tag(numero)
	  content_tag :div, :class => "telefono" do
		  image_tag("/resources/telefono.png", :size => "48x48") +
			content_tag(:big, numero)
		end
  end

end