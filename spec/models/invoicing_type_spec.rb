require 'spec_helper'

describe InvoicingType do
  subject { FactoryGirl.build(:invoicing_type) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :projects }
  end

  describe '#name' do
    it 'is required' do
      subject.name = nil
      subject.should have(1).error_on(:name)
      subject.errors.messages[:name].should include('can\'t be blank')
    end
  end

  describe '#description' do
    it 'is required' do
      subject.description = nil
      subject.should have(1).error_on(:description)
      subject.errors.messages[:description].should include('can\'t be blank')
    end
  end

end
