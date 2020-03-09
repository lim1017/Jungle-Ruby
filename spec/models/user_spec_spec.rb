require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'expects all fields to exist' do
      user=User.new(fname:"tom", lname:"lim", email:"lim@hotmail.com", password:"abc", password_confirmation:"abc")
      expect(user).to be_valid
    end


    it 'should fail if both password & password_confirmation fields are not filled' do
      user=User.new(fname:"tom", lname:"lim", email:"lim@hotmail.com", password:"abc", password_confirmation: nil)
      expect(user).to_not be_valid
    end


    it 'Should fail is no name or email is provided.' do
      user=User.new(fname:nil, lname:"lim", email:"lim@hotmail.com", password:"abc", password_confirmation:"abc")
      expect(user).to_not be_valid
    end

    it 'Should fail if password under 3 chars.' do
      user=User.new(fname:nil, lname:"lim", email:"lim@hotmail.com", password:"ab", password_confirmation:"ab")
      expect(user).to_not be_valid
    end

  end


  describe '.authenticate_with_credentials' do

    it 'verify that authenticate with credtials is used' do
      user=User.create!(fname:'tom', lname:"lim", email:"lim@hotmail.com", password:"abc", password_confirmation:"abc")


      expect(User.authenticate_with_credentials(user.email, 'abc')).to_not be_nil
    end


    it 'passes white spaces on edge/capital' do
      user=User.create!(fname:'tom', lname:"lim", email:"lim@hotmail.com", password:"abc", password_confirmation:"abc")


      expect(User.authenticate_with_credentials("LIM@hotmail.com  ", 'abc')).to_not be_nil
    end

  end



end
