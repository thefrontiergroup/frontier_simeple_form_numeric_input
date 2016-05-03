class NumericInput::ValidationParser

  attr_reader :attribute_name, :klass

  def initialize(klass, attribute_name)
    @attribute_name = attribute_name
    @klass = klass
  end

  def min
    if numericality_validation.present?
      greater_than = numericality_validation.options[:greater_than]
      greater_than_or_equal_to = numericality_validation.options[:greater_than_or_equal_to]

      if greater_than.present?
        greater_than + 1
      elsif greater_than_or_equal_to
        greater_than_or_equal_to
      end
    end
  end

  def max
    if numericality_validation.present?
      less_than = numericality_validation.options[:less_than]
      less_than_or_equal_to = numericality_validation.options[:less_than_or_equal_to]

      if less_than.present?
        less_than - 1
      elsif less_than_or_equal_to
        less_than_or_equal_to
      end
    end
  end

private

  # See: http://guides.rubyonrails.org/active_record_validations.html#numericality
  # for validation options.
  #
  # We care about:
  #   * greater_than
  #   * greater_than_or_equal_to
  #   * less_than
  #   * less_than_or_equal_to
  #
  # We don't care about:
  #   * equal_to
  #   * odd
  #   * even
  #
  def numericality_validation
    if klass.respond_to?(:validators)
      klass.validators_on(attribute_name).find do |validator|
        validator.is_a?(ActiveModel::Validations::NumericalityValidator)
      end
    end
  end

end
