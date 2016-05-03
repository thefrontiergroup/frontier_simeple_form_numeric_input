require 'spec_helper'

describe NumericInput::ValidationParser do

  describe '#max' do
    subject { parser.max }

    let(:parser) { NumericInput::ValidationParser.new(klass, attribute_name) }

    context "when it's a klass that has validators" do
      let(:klass) { User }

      context "for a field that has a less_than validation" do
        let(:attribute_name) { :field_with_less_than }
        it { should eq(2) }
      end

      context "for a field that has a less_than_or_equal_to validation" do
        let(:attribute_name) { :field_with_less_than_or_equal_to }
        it { should eq(4) }
      end

      context "for a field with no validations" do
        let(:attribute_name) { :field_without_validations }
        it { should eq(nil) }
      end

      context "for a field that doesn't exist on the model" do
        let(:attribute_name) { :other }
        it { should eq(nil) }
      end
    end

    context "when it's an object that doesn't have validators" do
      let(:klass) { nil.class }
      let(:attribute_name) { :field_without_validations }

      it { should eq(nil) }
    end
  end

  describe '#min' do
    subject { parser.min }
    let(:parser) { NumericInput::ValidationParser.new(klass, attribute_name) }

    context "when it's a klass that has validators" do
      let(:klass) { User }

      context "for a field that has a greater_than validation" do
        let(:attribute_name) { :field_with_greater_than }
        it { should eq(1) }
      end

      context "for a field that has a greater_than_or_equal_to validation" do
        let(:attribute_name) { :field_with_greater_than_or_equal_to }
        it { should eq(2) }
      end

      context "for a field with no validations" do
        let(:attribute_name) { :field_without_validations }
        it { should eq(nil) }
      end

      context "for a field that doesn't exist on the model" do
        let(:attribute_name) { :other }
        it { should eq(nil) }
      end
    end

    context "when it's an object that doesn't have validators" do
      let(:klass) { nil.class }
      let(:attribute_name) { :field_without_validations }

      it { should eq(nil) }
    end
  end

end
