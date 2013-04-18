require 'spec_helper'

describe UserType do
  subject { FactoryGirl.build(:user_type) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :description }
    it { should respond_to :users }
  end

end
