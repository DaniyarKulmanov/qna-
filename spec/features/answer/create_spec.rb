require 'rails_helper'

feature 'User can answer to a question', %q{
  In order to answer a question from community
  As an authenticated user
  I'd like answer to a question
} do
  given(:question) { create(:question) }

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background do
      sign_in(user)
      visit question_path(question)
    end

    scenario 'answers the question' do
      fill_in 'Body', with: 'Test body'
      check 'Correct'
      click_on 'Answer'

      expect(page).to have_content 'Test body'
      expect(page.check 'Correct')
    end

    scenario 'answers the question with errors' do
      click_on 'Answer'
      expect(page).to have_content "Body can't be blank"
    end
  end

  scenario 'Unauthenticated user answers the question' do
    visit question_path(question)

    expect(page).to_not have_button 'Answer'
  end
end
