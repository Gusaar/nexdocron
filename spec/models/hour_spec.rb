require 'spec_helper'

describe Hour do
  subject { FactoryGirl.build(:hour) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :total_hours }
    it { should respond_to :tasks_description }
    it { should respond_to :date }
    it { should respond_to :project }
    it { should respond_to :user }
  end

end
