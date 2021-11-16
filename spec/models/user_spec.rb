require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with matching password and password_confirmation fields' do
      user = User.new(name: 'Test', email: '123@gmail.com', password: 'abcd', password_confirmation: 'abcd')
      expect(user.save).to eq true
    end

    it 'should not save with UNmatching password and password_confirmation fields' do
      user = User.new(name: 'Test', email: '123@gmail.com', password: '1', password_confirmation: 'abcd')
      expect(user.save).to eq false
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not save without password and password_confirmation fields' do
      user = User.new(name: 'Test', email: '123@gmail.com')
      expect(user.save).to eq false
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save with already used email (not case sensitive)' do
      @user1 = User.new(name: 'Test', email: 'test@test.COM', password: 'abcd', password_confirmation: 'abcd')
      @user1.save
      @user2 = User.new(name: 'Test', email: 'TEST@TEST.com', password: 'abcd', password_confirmation: 'abcd')
      expect(@user2.save).to eq false
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not save without email' do
      user = User.new(name: 'Test', password: 'abcd', password_confirmation: 'abcd')
      expect(user.save).to eq false
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save without name' do
      user = User.new(email: 'test@test.COM', password: 'abcd', password_confirmation: 'abcd')
      expect(user.save).to eq false
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    #password length tests
    it 'should save with password longer than 4 characters or more' do
      user = User.new(name: 'Test', email: 'test@test.COM', password: 'abcd', password_confirmation: 'abcd')
      expect(user.save).to eq true
    end
    it 'should not save with password 3 characters or less' do
      user = User.new(name: 'Test', email: 'test@test.COM', password: 'def', password_confirmation: 'def')
      expect(user.save).to eq false
      expect(user).to_not be_valid
    end

  end
end
