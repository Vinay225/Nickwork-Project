# frozen_string_literal: true

class ContactController < ApplicationController
  before_action :authenticate_user!
  def index; end
end
