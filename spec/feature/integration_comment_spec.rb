# frozen_string_literal: true

# location: spec/feature/integration_comment_spec.rb
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
    fill_in 'Title', with: 'New Dog!' # create a news feed post
    fill_in 'Description', with: 'I just got a new dog!'
    click_on 'Create News post'
    expect(page).to have_content('New Dog!')
    expect(page).to have_content('I just got a new dog!')
    click_on 'Add New Comment'
    fill_in 'Description', with: 'I love dogs!' # creating a comment on news feed post
    click_on 'Create Comment'
    expect(page).to have_content('I love dogs!')

    click_link 1 # editing the comment
    fill_in 'Description', with: 'Show me your dog!'
    click_on 'Update Comment'
    expect(page).to have_content('Show me your dog!')

    click_link 2  # deleting the comment
    click_on 'Delete Comment'
    expect(page).to have_no_content('Show me your dog!')
  end
end
