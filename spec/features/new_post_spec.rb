require 'rails_helper'

RSpec.feature 'Creating new post', type: :feature do
  scenario 'Signed in user can create a new post' do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
  end

  # scenario 'Posts appear in reverse chronological order' do
  #   sign_up
  #   click_on('Create post')
  #   fill_in('Message', with: 'This is a message')
  #   click_button('Submit')
  #   click_on('Create post')
  #   fill_in('Message', with: 'This is another message')
  #   click_button('Submit')
  #   expect(page).to have_content("This is another message\nDelete\nThis is a message")
  # end

  scenario 'Signed in user can delete a new post' do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
    click_link('Delete')
    expect(page).not_to have_content('This is a message')
  end

  scenario 'Signed in user can delete a new post' do
    sign_up
    click_on('Create post')
    fill_in('Message', with: 'This is a message')
    click_button('Submit')
    expect(page).to have_content('This is a message')
    expect(page).to have_link('Delete')
    click_on('Logout')
    sign_up_2
    expect(page).not_to have_link('Delete')
  end

end
