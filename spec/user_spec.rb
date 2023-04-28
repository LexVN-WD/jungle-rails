require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'User Validations' do

    it "The user has everything" do
      @user = User.new(name: "Glenn", password: "Olivia", password_confirmation: "Olivia", email: "testEmail@email.com")
      @user.save
      expect(@user).to be_valid
    end

    it "throws an error when the name is not present" do
      @user = User.new(name: nil, password: "Olivia", password_confirmation: "Olivia", email: "testEmail@email.com")
      @user.save
      # expect(@user.errors.full_messages).to include("Name can't be blank")
      expect(@user).to_not be_valid
    end

    it "throws an error when the password is not present" do
      @user = User.new(name: "Glenn", password: nil, password_confirmation: "Olivia", email: "testEmail@email.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user).to_be not_valid
    end

    it "throws an error when the password confirmation is not present" do
      @user = User.new(name: "Glenn", password: "Olivia", password_confirmation: nil, email: "testEmail@email.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      # expect(@user).to_not be_valid
    end

    it "throws an error when the password confirmation is not the same as the password" do
      @user = User.new(name: "Glenn", password: "Olivia", password_confirmation: "Olivias", email: "testEmail@email.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation must match password")
      # expect(@user).to_not be_valid
    end

    it "throws an error when there is no email" do
      @user = User.new(name: "Glenn", password: "Olivia", password_confirmation: "Olivia", email: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Email cannot be blank")
    end

    it "throws an error if the email is already present in the database" do
      @user = User.new(name: "Glenn", password: "Olivia", password_confirmation: "Olivias", email: "testEmail@email.com")
      @user2 = User.new(name: "Glenn", password: "Olivia", password_confirmation: "Olivias", email: "testEmail@email.com")
      @user.save
      @user2.save
      expect(@user2).to_not be_valid
    end

    it "throws an error if the password doesn't reach a minimum length" do
      @user = User.new(name: "Glenn", password: "O", password_confirmation: "O", email: "testEmail@email.com")
      @user.save
      expect(@user).to_not be_valid
    end

  end

end