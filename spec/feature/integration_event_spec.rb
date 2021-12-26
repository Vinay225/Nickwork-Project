# frozen_string_literal: true

# location: spec/feature/integration_event_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  visit root_path
  click_link 'Sign In'
end

RSpec.describe 'Creating, editing, and destroying Event', type: :feature do
  scenario 'valid Event' do
    login
    visit new_event_path
    fill_in 'Title', with: 'Nick Day' # creating a new event
    fill_in 'Description', with: 'Socialize with the Nicks. Ice cream will be served'
    fill_in 'event_date_time', with: '2021-10-24T00:00:00'
    fill_in 'Location', with: 'College Station, TX'
    fill_in 'event_add_req', with: 'NA'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Nick Day')
    expect(page).to have_content('Socialize with the Nicks. Ice cream will be served')
    expect(page).to have_content('10/24/2021 at 12:00AM')
    expect(page).to have_content('NA')

    visit events_path
    click_on 'Edit' # editing the event
    fill_in 'Title', with: 'Cheesy Nick Day'
    fill_in 'Description', with: 'Mac and Cheese'
    fill_in 'event_date_time', with: '2021-10-26T00:00:00'
    fill_in 'Location', with: 'College Station, TX'
    fill_in 'event_add_req', with: 'Wear yellow'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Cheesy Nick Day')
    expect(page).to have_content('Mac and Cheese')
    expect(page).to have_content('10/26/2021 at 12:00AM')
    expect(page).to have_content('Wear yellow')

    visit events_path # deleting the event
    click_on 'Destroy'
    click_on 'Delete Event'
    expect(page).to have_no_content('Nick Day')
  end
end
