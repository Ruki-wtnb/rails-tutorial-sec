# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe 'ApplicationHelper', type: :request do
  describe 'hull title helper' do
    it 'return full title text' do
      expect(full_title).to eq 'Ruby on Rails Tutorial Sample App'
      expect(full_title('Help')).to eq 'Help | Ruby on Rails Tutorial Sample App'
    end
  end
end
