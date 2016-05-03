require 'rubygems'
require 'bundler'
Bundler.require

require 'rails/all'
require 'frontier_simple_form_numeric_input'

# Create an in-memory database to do some basic tests with a real model
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

# Add a table to mess around with
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.integer :field_without_validations
    t.integer :field_with_greater_than
    t.integer :field_with_greater_than_or_equal_to
    t.integer :field_with_less_than
    t.integer :field_with_less_than_or_equal_to
    t.integer :field_with_greater_than_and_less_than
  end
end

class User < ActiveRecord::Base
  validates :field_with_greater_than, numericality: {greater_than: 0}
  validates :field_with_greater_than_or_equal_to, numericality: {greater_than_or_equal_to: 2}
  validates :field_with_less_than, numericality: {less_than: 3}
  validates :field_with_less_than_or_equal_to, numericality: {less_than_or_equal_to: 4}
  validates :field_with_greater_than_and_less_than, numericality: {greater_than: 0, less_than: 3}
end

RSpec.configure do |config|
  config.include ActionView::Context
  config.include ActionView::Helpers
  config.include SimpleForm::ActionViewExtensions::FormHelper
end

# Required for using `simple_form_for`
def protect_against_forgery?
  false
end
