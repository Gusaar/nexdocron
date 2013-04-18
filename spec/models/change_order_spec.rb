require 'spec_helper'

describe ChangeOrder do
  subject { FactoryGirl.build(:change_order) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :hours }
    it { should respond_to :date }
    it { should respond_to :end_date }
    it { should respond_to :project }
  end

end
