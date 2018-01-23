require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'has all the valid params to create a new account' do
      @user = User.new(first_name: 'Ra',
                       last_name: 'Sun',
                       email: 'god@god.com',
                       password: 'God of Sun',
                       password_confirmation: 'God of Sun')
      expect(@user.valid?).to be true
    end

    it 'has password_confirmation different from password' do
      @user = User.new(first_name: 'Ra',
                       last_name: 'Sun',
                       email: 'god@god.com',
                       password: 'God of Sun',
                       password_confirmation: '123')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'has a non case sensitive email' do
      @user1 = User.new(first_name: 'Ra',
                       last_name: 'Sun',
                       email: 'god@god.com',
                       password: 'God of Sun',
                       password_confirmation: 'God of Sun')
      @user1.save
      @user2 = User.new(first_name: 'Ra',
                        last_name: 'Sun',
                        email: 'GOD@GOD.com',
                        password: 'God of Sun',
                        password_confirmation: 'God of Sun')

      expect(@user2.save).to be false
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should be invalid if it does not have a first name' do
      @user = User.new(last_name: 'Sun',
                       email: 'god@god.com',
                       password: 'God of Sun',
                       password_confirmation: 'God of Sun')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should be invalid if it does not have a last_name' do
      @user = User.new(first_name: 'Ra',
                       email: 'god@god.com',
                       password: 'God of Sun',
                       password_confirmation: 'God of Sun')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should be invalid if it does not have a email' do
      @user = User.new(first_name: 'Ra',
                       last_name: 'Sun',
                       password: 'God of Sun',
                       password_confirmation: 'God of Sun')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should be invalid if it password does not meet the minimum length' do
      @user = User.new(first_name: 'Ra',
                       last_name: 'Sun',
                       email: 'god@god.com',
                       password: '1',
                       password_confirmation: '1')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should login with correct email and password combination' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("God@test.com", "1234").present?).to eq(true)
    end
    it 'should not login with incorrect password' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("God@test.com", "123").present?).to eq(false)
    end
    it 'should not login with incorrect email' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("Go@test.com", "1234").present?).to eq(false)
    end
    it 'should login if there is a whitespace before email' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials(" God@test.com", "1234").present?).to eq(true)
    end
    it 'should login if there is a whitespace after email' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("God@test.com ", "1234").present?).to eq(true)
    end
    it 'should have email insensitive' do
      @user = User.create(first_name: "Odin", last_name: "God", email: "God@test.com", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("god@test.cOm", "1234").present?).to eq(true)
    end
  end
end
