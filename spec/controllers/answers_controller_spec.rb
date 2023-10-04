require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST #create' do
    let!(:answer) { create(:answer) }

    context 'with valid attributes' do
      it 'saves a new answer in the database'do
        expect{ post :create, params: { answer: attributes_for(:answer), question_id: answer.question_id} }.to change(Answer, :count).by(1)
      end

      it 'renders question show view' do
        post :create, params: { answer: attributes_for(:answer), question_id: answer.question_id}
        expect(response).to redirect_to answer.question
      end
    end
  end
end
