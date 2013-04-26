require 'spec_helper'

describe UserProject do
  subject { FactoryGirl.build(:user_project) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :user }
    it { should respond_to :project }
  end

  describe '#user' do
    it 'is required' do
      subject.user = nil
      subject.should have(1).error_on(:user)
    end

    it 'is an existent User' do
      subject.user = FactoryGirl.create(:user)
      subject.should be_valid
    end
  end

  describe '#project' do
    it 'is required' do
      subject.project = nil
      subject.should have(1).error_on(:project)
    end

    it 'is an existent Project' do
      subject.project = FactoryGirl.create(:project)
      subject.should be_valid
    end
  end

end
