require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid without a first name' do
    user = FactoryGirl.build(:user)
    user.first_name = nil
    expect(user).to be_invalid
  end 

  it 'is invalid without a last name' do
    user = FactoryGirl.build(:user)
    user.last_name = nil 
    expect(user).to be_invalid 
  end 

  it 'is invalid without an email address' do
    user = FactoryGirl.build(:user)
    user.email = nil
    expect(user).to be_invalid
  end 

  it 'is invalid if email is not formatted properly' do
    user = FactoryGirl.build(:user)
    user.email = "bob"
    expect(user).to be_invalid

    user.email = "bob.com"
    expect(user).to be_invalid
  end 

  it 'is invalid if email already exists' do
    user = FactoryGirl.create(:user, email: "bob@gmail.com")
    user1 = FactoryGirl.build(:user, email: "bob@gmail.com")
    user2 = FactoryGirl.build(:user, email: "bob@gmail.com")

    expect(user1).to be_invalid
    expect(user2).to be_invalid
  end 

  it 'is should have a minimum length of 6 chars' do
    user = FactoryGirl.create(:user)
    user.password = user.password_confirmation = "a" * 5
    expect(user).to be_invalid
  end

  it 'should require password_confirmation' do
    user = FactoryGirl.create(:user)
    user.password_confirmation = nil
    expect(user).to be_invalid
  end

  it 'should confirm password' do
    user = FactoryGirl.build(:user)
    user.password = "geomancy"
    user.password_confirmation = "globotron5000"
    expect(user.valid?).to eq(false)
    expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
  end

end