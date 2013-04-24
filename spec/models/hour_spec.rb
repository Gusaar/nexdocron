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

  describe '#tasks_description' do
    it 'is required' do
      subject.tasks_description = nil
      subject.should have(1).error_on(:tasks_description)
      subject.errors.messages[:tasks_description].should include('can\'t be blank')
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
      subject.date = '2001-02-03T04:05:06+07:00'.to_datetime
      subject.should have(0).error_on(:date)
    end
  end

  describe '#project' do
    it 'is required' do
      subject.project = nil
      subject.should have(1).error_on(:project)
      subject.errors.messages[:project].should include('can\'t be blank')
    end

    it 'is valid for an existent Project' do
      subject.project = FactoryGirl.create(:project)
      subject.should have(0).error_on(:project)
    end
  end

  describe '#user' do
    it 'is required' do
      subject.user = nil
      subject.should have(1).error_on(:user)
      subject.errors.messages[:user].should include('can\'t be blank')
    end

    it 'is valid for an existent User' do
      subject.user = FactoryGirl.create(:user)
      subject.should have(0).error_on(:user)
    end
  end

end
