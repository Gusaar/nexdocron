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

end
