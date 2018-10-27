require 'rails_helper'

RSpec.feature 'Creating new post', type: :feature do
  scenario 'Signed in user can create a new post' do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
  end
end
