require 'rails_helper'

feature 'User can see a question and its answers', %q{
  In order to find interesting question and its answers from community
  As an authenticated or unauthenticated user
  I'd like to be able see question and its answers
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }
  given!(:answers) { create_list(:answer, 3, question_id: question.id ) }

  scenario 'Authenticated see question and its answers' do
    sign_in(user)
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body

    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end

  scenario 'Unauthenticated see question and its answers' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body

    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end
end