require 'spec_helper'

describe ChangeOrder do
  subject { FactoryGirl.build(:change_order) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :hours }
    it { should respond_to :date }
    it { should respond_to :end_date }
    it { should respond_to :project }
  end

end
