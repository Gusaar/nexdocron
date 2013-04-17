require 'spec_helper'

describe UserType do
  subject { FactoryGirl.build(:user_type) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :description }
    it { should respond_to :users }
  end

end
