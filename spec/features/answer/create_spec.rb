require 'rails_helper'

feature 'User can answer to a question', %q{
  In order to answer a question from community
  As an authenticated user
  I'd like answer to a question
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'Authenticated user answer to a question' do
    sign_in(user)
    visit question_path(question)

    fill_in 'Body', with: 'Test body'
    check 'Correct'

    click_on 'Answer'

    expect(page).to have_content 'Test body'
    expect(page.check 'Correct')
  end
end
