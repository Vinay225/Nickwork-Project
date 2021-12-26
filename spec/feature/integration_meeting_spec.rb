# frozen_string_literal: true

# location: spec/feature/integration_meeting_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  visit root_path
  click_link 'Sign In'
end

RSpec.describe 'Creating, editing, and destroying meeting', type: :feature do
  scenario 'valid Meeting' do
    login
    visit new_meeting_path
    fill_in 'Title', with: 'Nick Day' # creating a new meeting
    fill_in 'Description', with: 'Socialize with the Nicks. Ice cream will be served'
    fill_in 'meeting_meeting_date', with: '2021-10-24T00:00:00'
    fill_in 'Location', with: 'College Station, TX'
    click_on 'Create Meeting'
    visit meetings_path
    expect(page).to have_content('Nick Day')
    expect(page).to have_content('Socialize with the Nicks. Ice cream will be served')
    expect(page).to have_content('20')
    expect(page).to have_content('10/24/2021 at 12:00AM')

    visit meetings_path
    click_on 'Edit' # editing the meeting
    fill_in 'Title', with: 'Cheesy Nick Day'
    fill_in 'Description', with: 'Mac and Cheese'
    fill_in 'meeting_meeting_date', with: '2021-10-26T00:00:00'
    fill_in 'Location', with: 'College Station, TX'
    click_on 'Update Meeting'
    visit meetings_path
    expect(page).to have_content('Cheesy Nick Day')
    expect(page).to have_content('Mac and Cheese')
    expect(page).to have_content('10/26/2021 at 12:00AM')

    visit meetings_path
    click_on 'Destroy'    # deleting the meeting
    click_on 'Delete meeting'
    expect(page).to have_no_content('Cheesy Nick Day')
    expect(page).to have_no_content('Mac and Cheese')
    expect(page).to have_no_content('10/24/2021 at 12:00AM')
  end
end
