# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :null_session

  def hello
    render html: 'hello, world!'
  end
end
