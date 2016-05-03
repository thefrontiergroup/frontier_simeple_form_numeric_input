class NumericInput < SimpleForm::Inputs::NumericInput

  def input(wrapper_options = nil)
    input_html_options[:min] ||= validation_parser.min
    input_html_options[:max] ||= validation_parser.max

    super
  end

private

  def validation_parser
    @validation_parser ||= NumericInput::ValidationParser.new(object.class, attribute_name)
  end

end

require_relative "numeric_input/validation_parser"
