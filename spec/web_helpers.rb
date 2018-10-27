def sign_up
  visit '/users/sign_up'
  fill_in('user_email', with: 'testuser1@gmail.com')
  fill_in('user_password', with: 'password1')
  fill_in('user_password_confirmation', with: 'password1')
  click_button('Sign up')
end

def login
  fill_in('user_email', with: 'testuser1@gmail.com')
  fill_in('user_password', with: 'password1')
  click_button('Log in')
end
