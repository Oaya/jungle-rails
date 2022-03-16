require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123456",
        password_confirmation: "123456"
        )
      expect(user).to be_valid
    end

    it 'password and password_confirmation should be matched' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123123",
        password_confirmation: "123456"
        )
      expect(user).not_to be_valid 
    end 

    it 'email must be unique' do
      user1 = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123123",
        password_confirmation: "123123"
        )

      user2 = User.create(
        name: "testName",
        email: "TEST@TEST.com",
        password: "456456",
        password_confirmation: "456456"
          )
      expect(user2.email).not_to match(user1.email)
    end

    it 'user password has to be longer than 6 words' do

      user = User.create(
        name: "testName",
        email: "TEST@TEST.com",
        password: "123456",
      
          )
      expect(user.password.length).to be >= 6 
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticated with spaces for email' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123456",
        password_confirmation: "123456"
          )
      user1 = User.authenticate_with_credentials(" test@test.com ", "123456")
      expect(user.id).to be(user1.id)
    end

    it 'should authenticated with wrong case for email' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123456",
        password_confirmation: "123456"
          )
      user1 = User.authenticate_with_credentials("Test@teST.com", "123456")
      expect(user.id).to be(user1.id)
    end
  end


  
end
