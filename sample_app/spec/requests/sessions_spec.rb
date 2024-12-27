require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  include SessionsHelper
  describe "GET /login" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    let(:params) {{ session: { email: User.last.email, password: 'test1234'} }}

    before do
      create(:user)
    end

    subject { post login_path, params: params }

    context "when success" do
      before { subject }
      it "return login success" do
        expect(response).to have_http_status(302)
      end

      it 'flash is empty' do
        expect(flash[:danger]).to be nil
      end

      it 'create user_id session' do
        expect(session[:user_id]).to be_kind_of(Integer)
      end

      it 'redirect to user page' do
        expect(response.body).to include("#{User.last.id}")
      end

      it 'return true logged_in' do
        expect(logged_in?).to be_truthy
      end
    end

    context 'when failuer' do
      before do
        params[:session][:email] = "abcd@test.com"
        params[:session][:password] = "password"
        subject
      end

      it "return unprocessable_entity" do
        expect(response).to have_http_status(422) 
      end

      it "flash is present" do
        expect(flash[:danger]).to be_present
      end

      it 'not create user_id session' do
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe 'DELETE /logout' do
    let(:params) {{ session: { email: User.last.email, password: 'test1234'} }}

    before do
      create(:user)
      post login_path, params: params
    end

    context "when success" do
      it "session user_id is nil" do
        delete logout_path
        expect(session[:user_id]).to be_nil
      end
    end
    

  end
end
