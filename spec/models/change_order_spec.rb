require 'spec_helper'

describe ChangeOrder do
  subject { FactoryGirl.build(:change_order) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :hours }
    it { should respond_to :date }
    it { should respond_to :end_date }
    it { should respond_to :project }
  end

  describe '#hours' do
    it 'is required' do
      subject.hours = nil
      subject.should have(2).error_on(:hours)
      subject.errors.messages[:hours].should include('can\'t be blank')
    end

    it 'is a number' do
      subject.hours = 'A word'
      subject.should have(1).error_on(:hours)
      subject.errors.messages[:hours].should include('is not a number')
    end

    it 'is greater than zero' do
      subject.hours = 0
      subject.should have(1).error_on(:hours)
      subject.errors.messages[:hours].should include('must be greater than 0')
    end
  end

  describe '#date' do
    it 'is required' do
      subject.date = nil
      subject.should have(1).error_on(:date)
      subject.errors.messages[:date].should include('can\'t be blank')
    end

    it 'does not allow no date data' do
      subject.date = 'Anything that is not a date'
      subject.should have(1).error_on(:date)
      subject.errors.messages[:date].should include('can\'t be blank')
    end

    it 'has the correct format' do
      subject.date = '2001-02-03'.to_datetime
      subject.should have(0).error_on(:date)
    end
  end

  describe '#end_date' do
    it 'has the correct format' do
      subject.end_date = '2007-02-03'.to_datetime
      subject.should have(0).error_on(:end_date)
    end
  end

end
