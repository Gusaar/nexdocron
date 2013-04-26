require 'spec_helper'

describe User do
  subject { FactoryGirl.build(:user) }

  include_context :model_expectations

  describe '#respond_to?' do
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :email }
    it { should respond_to :skype_id }
    it { should respond_to :phone }
    it { should respond_to :mobile }
    it { should respond_to :user_type }
    it { should respond_to :username }
    it { should respond_to :password }
    it { should respond_to :rate }
  end

  describe '#first_name' do
    it 'is required' do
      subject.first_name = nil
      subject.should have(1).error_on(:first_name)
      subject.errors.messages[:first_name].should include('can\'t be blank')
    end
  end

  describe '#last_name' do
    it 'is required' do
      subject.last_name = nil
      subject.should have(1).error_on(:last_name)
      subject.errors.messages[:last_name].should include('can\'t be blank')
    end
  end

  describe '#email' do
    let(:incorrect_formats) { ['snd', 'snd@', 'snd@.com', 'snd@mail'] }

    it 'is required' do
      subject.email = nil
      subject.should have(1).error_on(:email)
      subject.errors.messages[:email].should include('can\'t be blank')
    end

    it 'has an incorrect format' do
      incorrect_formats.each do |email|
        subject.email = email
        subject.should have(1).error_on(:email)
        subject.errors.messages[:email].should include('is invalid')
      end
    end

    it 'has a correct format' do
      subject.email = Faker::Internet.email
      subject.should be_valid
    end
  end

  describe '#phone' do
    context 'has 10 digits' do
      it 'has parenthesis' do
        subject.phone = '(555)-555-5555'
        subject.should be_valid
      end
    end

    context 'has a leading 1' do
      it 'has a leading +1' do
        subject.phone = "+1 (123) 456-7890"
        subject.should be_valid
      end

      it 'has a leading 1 without + symbol' do
        subject.phone = "1-123-456-7890"
        subject.should be_valid
      end
    end

    context 'has invalid format' do
      it 'contains non number characters' do
        subject.phone = '(TRE)-55I - 4567'
        subject.should have(1).error_on(:phone)
      end

      it 'does not contain enough numbers' do
        subject.phone = '1234567'
        subject.should have(1).error_on(:phone)
      end
    end
  end

  describe '#user_type' do
    it 'is required' do
      subject.user_type = nil
      subject.should have(1).error_on(:user_type)
      subject.errors.messages[:user_type].should include('can\'t be blank')
    end

    it 'is valid for an existent User' do
      subject.user_type = FactoryGirl.create(:user_type)
      subject.should have(0).error_on(:user_type)
    end
  end

  describe '#username' do
    it 'is unique' do
      another_user = FactoryGirl.create(:user)
      subject.username = another_user.username
      subject.should have(1).error_on(:username)
      subject.errors.messages[:username].should include('has already been taken')
    end
  end

  describe '#password' do
    it 'is required' do
      subject.password = nil
      subject.should have(2).error_on(:password)
      subject.errors.messages[:password].should include('can\'t be blank')
      subject.errors.messages[:password].should include('doesn\'t match confirmation')
    end
  end

  describe '#rate' do
    it 'is a number' do
      subject.rate = 'Any words'
      subject.should have(1).error_on(:rate)
      subject.errors.messages[:rate].should include('is not a number')
    end

    it 'is greater than zero' do
      subject.rate = 0
      subject.should have(1).error_on(:rate)
      subject.errors.messages[:rate].should include('must be greater than 0')
    end
  end


end
