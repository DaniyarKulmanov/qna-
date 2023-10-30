require 'rails_helper'

feature 'User can delete only own question', "
  In order to delete question
  As authenticated user
  I'd like to be able delete only own question
" do

  describe 'As authenticated' do
    given(:user) { create(:user) }
    background { sign_in(user) }

    context 'user an author' do
      given!(:question) { create(:question, author: user) }

      scenario 'able to delete own question' do
        visit questions_path

        find('tr', text: question.body).click_link('delete')
        expect(page).not_to have_content question.body
      end
    end

    context 'user not author' do
      given!(:question) { create(:question) }

      scenario "unable to delete someone else's question" do
        visit questions_path

        expect(page).to_not have_link 'delete'
      end
    end
  end

  describe 'Unauthenticated user' do
    given!(:question) { create(:question) }

    scenario 'unable to delete question' do
      visit questions_path

      expect(page).to_not have_link 'delete'
    end
  end

end