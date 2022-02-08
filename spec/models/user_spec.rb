require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid password" do
    it 'should not create a user if passwords arent a match' do
      @user = User.new({ first_name: 'Bob', last_name: 'Smith', email: 'bob@testmail.com', password: '123456', password_confirmation: '654321'})
      expect(@user).not_to be_valid
    end 
     it 'should return true if user is valid and password is equal to password_confirmation' do
      @user = User.new({ first_name: "bob", last_name: 'Smith', email: 'bob@testmail.com', password: '123456', password_confirmation: '123456'})
      expect(@user).to be_valid
    end 
    it 'should not create a user if password is less than 6 characters' do
      @user = User.new({ first_name: "bob", last_name: 'Smith', email: 'bob@testmail.com', password: '123', password_confirmation: '123'})
      expect(@user).not_to be_valid
    end 

    describe '.authenticate_with_credentials' do
      it 'should authenticate a user based on their email and password' do
        user = User.create({ first_name: 'Bob', last_name:'Smith', email: 'abc@gmail.com', password: '123456', password_confirmation: '123456'})
        expect(user).to eql(User.authenticate_with_credentials('abc@gmail.com', '123456'))
      end
      it 'should authenticate a user if the email has trailing spaces' do
        user = User.create({ first_name: 'Bob', last_name:'Smith', email: 'abc@gmail.com', password: '123456', password_confirmation: '123456'})
        expect(user).to eql(User.authenticate_with_credentials(' abc@gmail.com ', '123456'))
        end
      it 'should authenticate a user based on their email regardless of case' do
        user = User.create({ first_name: 'Bob', last_name:'Smith', email: 'abc@gmail.com', password: '123456', password_confirmation: '123456'})
        expect(user).to eql(User.authenticate_with_credentials('aBc@GMaIL.cOm', '123456'))
      end
  end 
  end
end
