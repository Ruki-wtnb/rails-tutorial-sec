require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  include SessionsHelper
  let(:params) {{ session: { email: User.last.email, password: 'test1234'} }}

  before do
    create(:user)
  end

  subject { log_in(User.last) }

  context 'test sessions helper' do
    it 'session user_id have user id' do
      subject
      expect(session[:user_id]).to be_kind_of(Integer)
    end

    it 'returns current user when present session' do
      subject
      expect(current_user).to eq(User.last)
    end

    it 'returns nil when absent sessions' do
      expect(current_user).to be nil
    end

    it 'returns true when present session' do
      subject
      expect(logged_in?).to be_truthy 
    end

    it 'returns false when absent session' do
      expect(logged_in?).to be_falsy
    end
  end
end
