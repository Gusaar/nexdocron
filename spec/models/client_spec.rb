require 'spec_helper'

describe Client do
  subject { FactoryGirl.build(:client) }

  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end

  describe '#respond_to?' do
    it { should respond_to :name }
    it { should respond_to :contact_name }
    it { should respond_to :contact_phone }
    it { should respond_to :contact_email }
    it { should respond_to :skype_id }
    it { should respond_to :projects }
  end

end
