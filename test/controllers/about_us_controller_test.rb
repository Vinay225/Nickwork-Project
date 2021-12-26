# frozen_string_literal: true

require 'test_helper'

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  test 'should get Index' do
    get about_us_Index_url
    assert_response :success
  end
end
