require 'rails_helper'

feature 'User can delete only own answer', "
  In order to delete answer
  As authenticated user
  I'd like to be able delete only own answer
" do

  describe 'As authenticated' do
    given(:user) { create(:user) }
    given(:question) { create(:question, author: user) }
    background { sign_in(user) }

    context 'user an author' do
      given!(:answers) { create_list(:answer, 3, question: question, author: user) }

      scenario 'able to delete own answer' do
        visit question_path(question)

        question.answers.each do |answer|
          find("tr[id=#{answer.id}]").click_link('delete')
          expect(page).not_to have_content answer.body
        end
      end
    end

    context 'user not author' do
      given!(:answers) { create_list(:answer, 3, question: question) }

      scenario "unable to delete someone else's answer" do
        visit question_path(question)

        question.answers.each do |answer|
          expect(page).to_not have_link 'delete'
          expect(page).to have_content answer.body
        end
      end
    end
  end

  describe 'Unauthenticated user' do
    given(:question) { create(:question) }
    given!(:answers) { create_list(:answer, 3, question: question) }

    scenario 'unable to delete question' do
      visit questions_path

      expect(page).to_not have_link 'delete'
    end
  end
end