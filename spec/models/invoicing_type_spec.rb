require 'spec_helper'

describe InvoicingType do
  subject { FactoryGirl.build(:invoicing_type) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :description }
    it { should respond_to :projects }
  end

end
