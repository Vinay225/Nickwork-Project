# frozen_string_literal: true

# location: spec/feature/integration_gallery_spec.rb
require 'rails_helper'
require 'down'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  visit root_path
  click_link 'Sign In'
end

RSpec.describe 'Creating, editing, and destroying a gallery post', type: :feature do
  scenario 'valid News Feed Post' do
    login
    visit new_gallery_path
    fill_in 'Title', with: 'Nick Day' # create a gallery post
    fill_in 'Description', with: 'Photos from the day'
    Down.download("https:\/\/nick-network.s3.us-east-2.amazonaws.com\/Default.jpg", destination: 'app/assets/images')
    find(:css, '#gallery_photo').set(File.join("#{Rails.root}/app/assets/images", 'Default.jpg'))
    click_on 'Create Gallery'
    expect(page).to have_content('Nick Day')
    expect(page).to have_content('Photos from the day')
    expect(ActiveStorage::Attachment.count).to eq(1)

    click_on 'Edit' # editing the news feed post
    fill_in 'Title', with: 'Cheesy Nick Day'
    fill_in 'Description', with: 'Mac and Cheese photos'
    click_on 'Update Gallery'
    expect(page).to have_content('Cheesy Nick Day')
    expect(page).to have_content('Mac and Cheese photos')

    click_on 'Destroy'  # deleting the gallery post
    click_on 'Delete Post'
    expect(page).to have_no_content('Cheesy Nick Day')
    expect(page).to have_no_content('Mac and Cheese photos')
    expect(ActiveStorage::Attachment.count).to eq(0)
  end
end
