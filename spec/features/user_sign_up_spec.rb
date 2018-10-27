require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'Loads sign up page and asks user to sign up' do
      visit '/'
      expect(page).to have_selector('#user_email')
      expect(page).to have_selector('#user_password')
  end

  scenario 'User can sign up' do
    sign_up
      expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'User can login' do
    sign_up
    click_on('Logout')
    login
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User can log out' do
    sign_up
      click_on('Logout')
      expect(page).to have_content('Signed out successfully.')
  end
end
