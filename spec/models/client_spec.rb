require 'spec_helper'

describe Client do
  subject { FactoryGirl.build(:client) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :name }
    it { should respond_to :contact_name }
    it { should respond_to :contact_phone }
    it { should respond_to :contact_email }
    it { should respond_to :skype_id }
    it { should respond_to :projects }
  end

end
