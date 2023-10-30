require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    before { login(user) }
    let!(:answer) { create(:answer) }

    context 'with valid attributes' do
      it 'saves a new answer in the database'do
        expect{ post :create, params: { answer: attributes_for(:answer), question_id: answer.question_id} }.to change(Answer, :count).by(1)
      end

      it 'redirects to question' do
        post :create, params: { answer: attributes_for(:answer), question_id: answer.question_id}
        expect(response).to redirect_to answer.question
      end
    end

    context 'with invalid attributes' do
      it 'does not save answer to database' do
        expect{ post :create, params: { answer: attributes_for(:answer, :fake), question_id: answer.question_id} }.to_not change(Answer, :count)
      end

      it 'renders question show view' do
        post :create, params: { answer: attributes_for(:answer, :fake), question_id: answer.question_id}
        expect(response).to render_template "questions/show"
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }

    let!(:answer) { create(:answer, author: user) }

    it 'deletes the answer' do
      expect{ delete :destroy, params: { id: answer, question_id: answer.question } }.to change(Answer, :count).by(-1)
    end

    it "redirects to answer's question" do
      delete :destroy, params: { id: answer, question_id: answer.question }
      expect(response).to redirect_to question_path(answer.question)
    end
  end
end
