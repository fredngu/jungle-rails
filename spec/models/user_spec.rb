require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "new init product to be true" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user.save
      expect(@user.valid?).to be true
    end

    it "return 'Password can't be blank' when :password is nil" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => nil, :password_confirmation => "Password")
      @user.save
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "return 'Name can't be blank' when :name is nil" do
      @user = User.new(:name => nil, :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user.save
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "return 'Password confirmation doesn't match Password' when :password does not match :password_confirmation" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Not Password", :password_confirmation => "Password")
      @user.save
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "emails must be unique" do
      @user1 = User.new(:name => "Username", :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user1.save
      @user2 = User.new(:name => "Username1", :email => "testemail@email.com", :password => "Password1", :password_confirmation => "Password1")
      @user2.save
      expect(@user2).to_not be_valid
    end

    it "return 'Password is too short (minimum is 6 characters)' when :password is less than 6 characters" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Pass", :password_confirmation => "Password")
      @user.save
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it "user.authenticate_with_credentials should be valid" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user.save
      user1 = User.authenticate_with_credentials("testemail@email.com", "Password")
      expect(user1.email).to eql("testemail@email.com")
    end

    it "remove trailing whitespace when logging in" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user.save
      user1 = User.authenticate_with_credentials("  testemail@email.com  ", "Password")
      expect(user1.email).to eql("testemail@email.com")
    end

    it "wrong case should work when logging in" do
      @user = User.new(:name => "Username", :email => "testemail@email.com", :password => "Password", :password_confirmation => "Password")
      @user.save
      user1 = User.authenticate_with_credentials("teStEmAIl@email.com", "Password")
      expect(user1.email).to eql("testemail@email.com")
    end
  
  end

  
end
