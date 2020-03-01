require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new User' do
    scenario 'succes' do
      visit new_user_registration_path
      within(".form-inputs") do
        fill_in 'Email', with: 'john@nerdchimp.io'
        fill_in 'user[password]', with: '123123'
        fill_in 'Password confirmation', with: '123123'
      end
      click_button 'Sign up'
      expect(page).to_not have_content 'Sign up'
      current_url == root_path
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context 'Log in' do
    scenario 'succes' do
      User.create(email: 'john@nerdchimp.io', password: "123123")
      visit new_user_session_path
      within(".form-inputs") do
        fill_in 'Email', with: 'john@nerdchimp.io'
        fill_in 'Password', with: '123123'
      end
      click_button 'Log in'

      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'fail' do
      visit new_user_session_path
      within(".form-inputs") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email'
    end

  end

end
