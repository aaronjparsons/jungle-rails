require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      @user = User.new(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(@user).to be_valid
    end

    it "is not valid without a name " do
      @user = User.new(name: nil, email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user = User.new(name: "Test", email: nil, password: "teSteR", password_confirmation: "teSteR")
      expect(@user).to_not be_valid
    end

    it "is not valid without a password" do
      @user = User.new(name: "Test", email: "test@test.com", password: nil, password_confirmation: "teSteR")
      expect(@user).to_not be_valid
    end

    it "is not valid without a password confirmation" do
      @user = User.new(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "is not valid if password & password confirmation do not match" do
      @user = User.new(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "rETsET")
      expect(@user).to_not be_valid
    end

    it "is not valid if email is not unique (case insensitive)" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      @new_user = User.new(name: "User Two", email: "tEst@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(@new_user).to_not be_valid
    end

    it "is not valid if password is too short (6 chars minimum)" do
      @user = User.new(name: "Test", email: "test@test.com", password: "teSt", password_confirmation: "teSt")
      expect(@user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    it "is valid with valid attributes" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(User.authenticate_with_credentials("test@test.com", "teSteR")).to eq(@user)
    end

    it "is not valid without a valid email" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(User.authenticate_with_credentials("tester@test.com", "teSteR")).to be nil
    end

    it "is not valid without a valid password" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(User.authenticate_with_credentials("test@test.com", "rETsET")).to be nil
    end

    it "is valid with extra spaces before and/or after their email" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(User.authenticate_with_credentials(" test@test.com ", "teSteR")).to eq(@user)
    end

    it "is valid with with case insensitive email" do
      @user = User.create(name: "Test", email: "test@test.com", password: "teSteR", password_confirmation: "teSteR")
      expect(User.authenticate_with_credentials("tEst@teSt.com", "teSteR")).to eq(@user)
    end
  end
end
