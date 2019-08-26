# Esperamos eliminar esta clase una vez en simple_form sea mejorado
# e integrada la solicitud de cambio:
#
#https://github.com/plataformatec/simple_form/pull/1646/files

class RichTextAreaInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, 
                                                 wrapper_options)

    @builder.rich_text_area(attribute_name, merged_input_options)
  end
end
