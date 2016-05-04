# Frontier SimpleForm Numeric Input

Installing this gem will override the `SimpleForm::Inputs::NumericInput` with the `NumericInput` class. The `NumericInput` class uses a model's numericality validations to set the min and max values for an input.

## Installation

```ruby
gem 'frontier_simple_form_numeric_input', github: 'thefrontiergroup/frontier_simple_form_numeric_input'
```

## Usage

Installing the gem will cause the `SimpleForm::Inputs::NumericInput` to be overrided automatically.

The `NumericInput`'s min and max values can be overriden as you normally would with a `SimpleForm` input:

```ruby
= simple_form_for(@user) do |f|
  - f.input :age, input_html: {min: 18, max: 90}
```
