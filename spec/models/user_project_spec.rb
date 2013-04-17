require 'spec_helper'

describe UserProject do
  subject { FactoryGirl.build(:user_project) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :user }
    it { should respond_to :project }
  end

end
