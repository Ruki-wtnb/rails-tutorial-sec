# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Post /users/new', type: :request do
    subject { post '/users', params: params }
    let(:params) do
      { user: {
        name: 'Roman Dicki Ret.',
        email: 'sherry@mosciski-kovacek.example',
        password: 'test1234',
        password_confirmation: 'test1234'
      } }
    end

    it 'count up User model when success' do
      expect { subject }.to change(User, :count)
    end

    it 'not change User model when failed' do
      params[:user][:name] = ''
      expect { subject }.not_to change(User, :count)
      expect(response).to have_http_status(422)
    end
  end
end
