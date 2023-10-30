require 'rails_helper'

feature 'User can sign up', %q{
        In order to get full functions
        As Unauthenticated user
        I'd like to be able sign up
} do

  scenario 'Unregistered user tries to sign up' do
    visit new_user_session_path
    click_on 'Sign up'
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Password', with: '111111111'
    fill_in 'Password confirmation', with: '111111111'
    click_on 'Sign up'

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end