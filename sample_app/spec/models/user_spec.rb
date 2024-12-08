# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

# bundle exec rspec spec/models/user_spec.rb

RSpec.describe User, type: :model do
  describe 'User model validation' do
    before 'preparation user model' do
      @user = create(:user)
    end

    context 'User validation' do
      it 'sould be valid' do
        expect(@user).to be_valid
      end
    end

    context 'User name validation' do
      it 'name should be present' do
        @user.name = ''
        expect(@user.valid?).to be_falsey
      end

      it 'name should be valid' do
        @user.email = ''
        expect(@user.valid?).to be_falsey
      end

      it 'name should not be too long' do
        @user.name = 'a' * 51
        expect(@user.valid?).to be_falsey
      end
    end

    context 'User email validatioin' do
      it 'email should not be too long' do
        @user.email = "#{'a' * 244}@example.com"
        expect(@user.valid?).to be_falsey
      end

      it 'email validation should accept valid addresses' do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com foo@bar..com]

        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user.valid?).to be_falsey, "#{invalid_address.inspect} should be valid"
        end
      end

      it 'email should be unique' do
        duplicate_user = @user.dup
        @user.save
        expect(duplicate_user.valid?).to be_falsey
      end

      it 'email address should be saved as lowercase' do
        mixed_case_email = 'Foo@ExAMPle.CoM'
        @user.email = mixed_case_email
        @user.save
        expect(mixed_case_email.downcase).to eq @user.reload.email
      end
    end

    context 'User password validation' do
      it 'password should be present (non blank)' do
        @user.password = @user.password_confirmation = ' ' * 8
        expect(@user).not_to be_valid
      end

      it 'password should be have a minimum length' do
        @user.password = @user.password_confirmation = 'a' * 7
        expect(@user).not_to be_valid
      end
    end
  end
end
