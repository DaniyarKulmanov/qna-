require 'rails_helper'

feature 'User can log out', %q{
        In order to enter display mode
        As an authenticated user
        I'd like to be able to sign out
} do
  given(:user) { create(:user) }

  scenario 'Authenticated user tries Log out' do
    sign_in(user)
    visit questions_path
    click_on 'log out'

    expect(page).to have_content I18n.t('devise.sessions.signed_out')
  end
end