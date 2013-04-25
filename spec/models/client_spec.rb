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

  describe '#name' do
    it 'is required' do
      subject.name = nil
      subject.should have(1).error_on(:name)
      subject.errors.messages[:name].should include('can\'t be blank')
    end
  end

  describe '#contact_phone' do
    context 'has 10 digits' do
      it 'has parenthesis' do
        subject.contact_phone = '(555)-555-5555'
        subject.should be_valid
      end
    end

    context 'has a leading 1' do
      it 'has a leading +1' do
        subject.contact_phone = "+1 (123) 456-7890"
        subject.should be_valid
      end

      it 'has a leading 1 without + symbol' do
        subject.contact_phone = "1-123-456-7890"
        subject.should be_valid
      end
    end

    context 'has invalid format' do
      it 'contains non number characters' do
        subject.contact_phone = '(TRE)-55I - 4567'
        subject.should have(1).error_on(:contact_phone)
      end

      it 'does not contain enough numbers' do
        subject.contact_phone = '1234567'
        subject.should have(1).error_on(:contact_phone)
      end
    end
  end

  describe '#contact_email' do
    let(:incorrect_formats) { ['snd', 'snd@', 'snd@.com', 'snd@mail'] }

    it 'has an incorrect format' do
      incorrect_formats.each do |email|
        subject.contact_email = email
        subject.should have(1).error_on(:contact_email)
      end
    end
  end
end
