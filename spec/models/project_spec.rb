require 'spec_helper'

describe Project do
  subject { FactoryGirl.build(:project) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :start_date }
    it { should respond_to :end_date }
    it { should respond_to :name }
    it { should respond_to :total_hours }
    it { should respond_to :client }
    it { should respond_to :invoicing_type }
    it { should respond_to :hours }
    it { should respond_to :change_orders }
    it { should respond_to :users }
  end

end
