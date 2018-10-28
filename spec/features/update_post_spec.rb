# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'Signed in user can edit a new post' do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
    click_on('Edit Post')
    fill_in('Message', with: 'lots of changes to post')
    click_button('Update!')
    expect(page).not_to have_content('This is a message')
    expect(page).to have_content('lots of changes to post')
  end

  scenario 'Signed in user can edit a new post' do
    sign_up
    Timecop.freeze(Time.zone.parse('12:00 13 October 2018'))
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('Sat Oct 13 12:00:00')
    Timecop.freeze(Time.zone.parse('12:45 13 October 2018'))
    click_on('Edit Post')
    fill_in('Message', with: 'lots of changes to post')
    click_button('Update!')
    expect(page).not_to have_content('Sat Oct 13 12:00:00')
    expect(page).to have_content('Sat Oct 13 12:45:00')
  end

  scenario "Signed in user cannot edit someone else's post" do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
    expect(page).to have_link('Edit Post')
    click_on('Logout')
    sign_up_2
    expect(page).not_to have_link('Edit Post')
  end
end
