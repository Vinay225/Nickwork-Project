# frozen_string_literal: true

# location: spec/feature/integration_newsfeed_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  visit root_path
  click_link 'Sign In'
end

RSpec.describe 'Creating, editing, and destroying a news feed post', type: :feature do
  scenario 'valid News Feed Post' do
    login
    visit new_news_post_path
    fill_in 'Title', with: 'Nick Day' # create a news feed post
    fill_in 'Description', with: 'Selling Nickwork shirt'
    click_on 'Create News post'
    expect(page).to have_content('Nick Day')
    expect(page).to have_content('Selling Nickwork shirt')

    click_on 'Edit' # editing the news feed post
    fill_in 'Title', with: 'Cheesy Nick Day'
    fill_in 'Description', with: 'Mac and Cheese shirt'
    click_on 'Update News post'
    click_on 'Back'
    expect(page).to have_content('Cheesy Nick Day')
    expect(page).to have_content('Mac and Cheese shirt')

    click_on 'Delete'  # deleting the news feed post
    click_on 'Delete News Post'
    expect(page).to have_no_content('Cheesy Nick Day')
    expect(page).to have_no_content('Mac and Cheese shirt')
  end
end
