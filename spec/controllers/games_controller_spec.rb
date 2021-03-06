require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'POST create' do  
    subject { post :create}
   
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }
      
      before { sign_in(user) }

      it 'redirects to new game' do
        expect(subject).to redirect_to(user.games.last)
      end
      it do
        subject
        expect(response).to have_http_status(302)
      end
    end

    context 'when user is NOT signed in' do
      it ' does not redirects to new game' do
        expect(subject).not_to redirect_to(Game.last)
      end
      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end
  
  describe 'GET show' do
    subject { get :show, params: params }
    
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }
      
      before { sign_in(user) }
    
      let(:params) do
        { id: game.id }
      end  
      let!(:game) { FactoryBot.create(:game, user: user) }
      let!(:word) { FactoryBot.create(:word, :with_translations) }

      it 'assigns @game' do 
        subject
        expect(assigns(:game)).to eq(game)
      end
      
      it 'assigns @word' do 
        subject
        expect(assigns(:word)).to eq(word)
      end
      
      it 'renders the show template' do 
        subject
        expect(response).to render_template(:show)
      end
    end
    context 'when user is NOT signed in' do
    
      let(:params) do
        { id: game.id }
      end  
      let!(:game) { FactoryBot.create(:game) }
      let!(:word) { FactoryBot.create(:word) }

      it 'does not assigns @game' do 
        subject
        expect(assigns(:game)).not_to eq(game)
      end
      it 'does not assigns @word' do 
        subject
        expect(assigns(:word)).not_to eq(word)
      end
      it 'does not renders the show template' do 
        subject
        expect(response).not_to render_template(:show)
      end
      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end
end    
