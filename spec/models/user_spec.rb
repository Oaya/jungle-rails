require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123",
        password_confirmation: "123"
        )
      expect(user).to be_valid
    end

    it 'password and password_confirmation should be matched' do
      user = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123",
        password_confirmation: "456"
        )
      expect(user).not_to be_valid 
    end 

    it 'email must be unique' do
      user1 = User.create(
        name: "testName",
        email: "test@test.com",
        password: "123",
        password_confirmation: "123"
        )

      user2 = User.create(
        name: "testName",
        email: "TEST@TEST.com",
        password: "456",
        password_confirmation: "456"
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
  
end
