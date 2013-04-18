require 'spec_helper'

describe UserProject do
  subject { FactoryGirl.build(:user_project) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :user }
    it { should respond_to :project }
  end

end
