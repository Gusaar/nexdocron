require 'spec_helper'

describe Project do
  subject { FactoryGirl.build(:project) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :start_date }
    it { should respond_to :end_date }
    it { should respond_to :name }
    it { should respond_to :total_hours }
    it { should respond_to :client }
    it { should respond_to :invoicing_type }
    it { should respond_to :hours }
    it { should respond_to :change_orders }
  end

end
