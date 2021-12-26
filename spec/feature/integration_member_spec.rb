# frozen_string_literal: true

# location: spec/feature/integration_member_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  visit root_path
  click_link 'Sign In'
end

RSpec.describe 'Creating, editing, and destroying Member', type: :feature do
  scenario 'valid Member' do
    login
    visit new_member_path # creating a member
    # fill_in 'Name', with: 'Nick'
    fill_in 'Description', with: 'Howdy my name is Nick!'
    fill_in 'Birthday', with: '2021-10-24'
    fill_in 'Classification', with: 'Senior'
    fill_in 'Major', with: 'Computer Science'
    # fill_in 'Email', with: 'email@email.com'
    fill_in 'Phone', with: '666-666-666'
    click_on 'Create Member'
    visit members_path
    click_on 'View'
    # expect(page).to have_content('Nick')
    expect(page).to have_content('Howdy my name is Nick!')
    expect(page).to have_content('10/24/2021')
    expect(page).to have_content('Senior')
    expect(page).to have_content('Computer Science')
    # expect(page).to have_content('email@email.com')
    expect(page).to have_content('666-666-666')

    visit members_path
    click_on 'Edit' # editing the member
    # fill_in 'Name', with: 'NicAlyssa'
    fill_in 'Description', with: 'Updated desciption yall!'
    fill_in 'Birthday', with: '2019-11-04'
    fill_in 'Classification', with: 'Sophomore'
    fill_in 'Major', with: 'Liberal Arts'
    # fill_in 'Email', with: 'nick@tamu.edu'
    fill_in 'Phone', with: '420-420-420'
    click_on 'Update Member'
    visit members_path
    click_on 'View'
    # expect(page).to have_content('NicAlyssa')
    expect(page).to have_content('Updated desciption yall!')
    expect(page).to have_content('11/04/2019')
    expect(page).to have_content('Sophomore')
    expect(page).to have_content('Liberal Arts')
    # expect(page).to have_content('nick@tamu.edu')
    expect(page).to have_content('420-420-420')

    visit members_path # deleting the member
    click_on 'Destroy'
    click_on 'Delete member'
    expect(page).to have_no_content('Updated desciption yall!')
    expect(page).to have_no_content('2019-11-04')
    expect(page).to have_no_content('Sophomore')
    expect(page).to have_no_content('Liberal Arts')
    expect(page).to have_no_content('nick@tamu.edu')
    expect(page).to have_no_content('420-420-420')
  end
end
