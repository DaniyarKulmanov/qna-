require 'rails_helper'

feature 'User can see all questions', %q{
  In order to find interesting question from community
  As an authenticated or unauthenticated user
  I'd like to be able see all questions
} do

  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 3) }

  scenario 'Registered user tries to see all questions' do
    sign_in(user)
    visit questions_path

    questions.each do |question|
      expect(page).to have_content question.title
      expect(page).to have_content question.body
    end
  end

  scenario 'Unregistered user tries to see all questions' do
    visit questions_path

    questions.each do |question|
      expect(page).to have_content question.title
      expect(page).to have_content question.body
    end
  end
end