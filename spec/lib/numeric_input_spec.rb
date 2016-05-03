require 'spec_helper'

describe NumericInput do

  describe '#input' do
    subject do
      simple_form_for(User.new, url: "stub") do |f|
        f.input(field)
      end
    end

    describe "renders a normal field for a field without validations" do
      let(:field) { :field_without_validations }
      it { should include('<input class="numeric integer optional" type="number" step="1" name="user[field_without_validations]" id="user_field_without_validations" />') }
    end

    describe "renders a min correctly for a field with greater_than" do
      let(:field) { :field_with_greater_than }
      it { should include('<input class="numeric integer optional" min="1" type="number" step="1" name="user[field_with_greater_than]" id="user_field_with_greater_than" />') }
    end

    describe "renders a min correctly for a field with greater_than_or_equal_to" do
      let(:field) { :field_with_greater_than_or_equal_to }
      it { should include('<input class="numeric integer optional" min="2" type="number" step="1" name="user[field_with_greater_than_or_equal_to]" id="user_field_with_greater_than_or_equal_to" />') }
    end

    describe "renders a max correctly for a field with less_than" do
      let(:field) { :field_with_less_than }
      it { should include('<input class="numeric integer optional" max="2" type="number" step="1" name="user[field_with_less_than]" id="user_field_with_less_than" />') }
    end

    describe "renders a max correctly for a field with less_than_or_equal_to" do
      let(:field) { :field_with_less_than_or_equal_to }
      it { should include('<input class="numeric integer optional" max="4" type="number" step="1" name="user[field_with_less_than_or_equal_to]" id="user_field_with_less_than_or_equal_to" />') }
    end

    describe "renders a min and max for a field with multiple validations" do
      let(:field) { :field_with_greater_than_and_less_than }
      it { should include('<input class="numeric integer optional" min="1" max="2" type="number" step="1" name="user[field_with_greater_than_and_less_than]" id="user_field_with_greater_than_and_less_than" />') }
    end
  end

end
