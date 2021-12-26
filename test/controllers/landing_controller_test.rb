# frozen_string_literal: true

require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test 'should get Index' do
    get landing_Index_url
    assert_response :success
  end
end
