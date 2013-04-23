require 'spec_helper'

describe Hour do
  subject { FactoryGirl.build(:hour) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :total_hours }
    it { should respond_to :tasks_description }
    it { should respond_to :date }
    it { should respond_to :project }
    it { should respond_to :user }
  end

  describe '#total_hours' do
    it 'is required' do
      subject.total_hours = nil
      subject.should have(2).error_on(:total_hours)
      subject.errors.messages[:total_hours].should include('can\'t be blank')
    end

    it 'is a number' do
      subject.total_hours = 'A word'
      subject.should have(1).error_on(:total_hours)
      subject.errors.messages[:total_hours].should include('is not a number')
    end

    it 'is greater than zero' do
      subject.total_hours = 0
      subject.should have(1).error_on(:total_hours)
      subject.errors.messages[:total_hours].should include('must be greater than 0')
    end
  end

end
