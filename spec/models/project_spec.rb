require 'spec_helper'

describe Project do
  subject { FactoryGirl.build(:project) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :start_date }
    it { should respond_to :end_date }
    it { should respond_to :name }
    it { should respond_to :total_hours }
    it { should respond_to :client }
    it { should respond_to :invoicing_type }
    it { should respond_to :hours }
    it { should respond_to :change_orders }
    it { should respond_to :users }
    it { should respond_to :user_projects }
  end

  describe '#start_date' do
    it 'has the correct format' do
      subject.start_date = '2001-02-03'.to_datetime
      subject.should have(0).error_on(:start_date)
    end
  end

  describe '#end_date' do
    it 'has the correct format' do
      subject.end_date = '2002-05-04'.to_datetime
      subject.should have(0).error_on(:end_date)
    end
  end

  describe '#total_hours' do
    it 'is a number' do
      subject.total_hours = Faker::Lorem.word
      subject.should have(1).error_on(:total_hours)
      subject.errors.messages[:total_hours].should include('is not a number')
    end

    it 'is greater than zero' do
      subject.total_hours = -5 
      subject.should have(1).error_on(:total_hours)
      subject.errors.messages[:total_hours].should include('must be greater than 0')
    end
  end

  describe '#name' do
    it 'is required' do
      subject.name = nil
      subject.should have(1).error_on(:name)
      subject.errors.messages[:name].should include('can\'t be blank')
    end
  end

  describe '#client'do
    it 'is required' do
      subject.client = nil
      subject.should have(1).error_on(:client)
      subject.errors.messages[:client].should include('can\'t be blank')
    end

    it 'is valid for an existent Client' do
      subject.client = FactoryGirl.create(:client)
      subject.should have(0).error_on(:client)
    end
  end

end
