require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET index' do  
    before { get :index } 
    
    context 'when some words present' do
      let!(:word){ FactoryBot.create(:word) }

      it 'assigns @words' do 
        expect(assigns(:words)).to eq([word])
      end
      it 'renders the index template' do 
        expect(response).to render_template(:index)
      end
    end
    
    context 'when no words' do
      it 'assigns @words' do 
        expect(assigns(:words)).to eq([])
      end
      it 'renders the index template' do 
        expect(response).to render_template(:index)
      end
    end
    
  end

  describe 'GET new' do
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'assigns @word' do 
        expect(assigns(:word)).to be_a_new(Word)
      end

      it 'renders the new template' do 
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end
    
    context 'when user is NOT signed in' do
      before do
        get :new
      end

      it 'does not assign @word' do 
        expect(assigns(:word)).to eq(nil)
      end

      it 'does not render the new template' do 
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(302)
      end
    end
   end

  describe 'POST create' do
    subject { post :create, params: params }
   
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }
      
      before { sign_in(user) }

      context 'valid params' do
        let!(:language_1){ FactoryBot.create(:language) }
        let(:params) do
          {word: { content: 'cat', language_id: language_1.id } } 
        end  
        it 'creates new word' do
          expect { subject }.to change(Word, :count).from(0).to(1)
        end
        it do
          subject
          expect(response).to have_http_status(302)
        end

        context 'when some translation is present' do
          let!(:language_2){ FactoryBot.create(:language, :spanish) }
          let(:params) do
            {
              word: 
               { 
                 content: 'cat', 
                 language_id: language_1.id,
                 translations_attributes:
                   {
                     '5847365027486' =>
                       { 
                         content: 'Gato',
                         language_id: language_2.id,
                         _destroy: false
                      }
                      
                   } 
                }
            } 
          end  
          
          it 'creates two words' do
            expect { subject }.to change(Word, :count).from(0).to(2)
          end

          it 'creates translation for first word' do
            subject
            expect(Word.first.reload.translations.count).to eq(1)
          end
        end

      end
      
      context 'invalid params' do
        let(:params) do
          {word: { content: '' } } 
        end  
        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end
        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end
    
    context 'when user is NOT signed in' do
      context 'valid params' do
        let!(:language){ FactoryBot.create(:language) }
        let(:params) do
          {word: { content: 'cat', language_id: language.id } } 
        end  
        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end
        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
      
      context 'invalid params' do
        let(:params) do
          {word: { content: '' } } 
        end  
        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end
        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }
    
    let(:params) do
      { id: word.id }
    end  
    let!(:word) { FactoryBot.create(:word) }

    it 'assigns @word' do 
      expect(assigns(:word)).to eq(word)
    end
    it 'renders the show template' do 
      expect(response).to render_template(:show)
    end
  end
  
  describe 'GET edit' do
    subject { get :edit, params: params }
    
    let(:params) do
      { id: word.id }
    end  
    let!(:word) { FactoryBot.create(:word, user: user) }
    let(:user) { FactoryBot.create(:user) }
    
    context 'when user is signed in' do
      
      before do
        sign_in(user)
        subject
      end

      it 'assigns @word' do 
        expect(assigns(:word)).to eq(word)
      end
      it 'renders the ediit template' do 
        expect(response).to render_template(:edit)
      end
    end
    
    context 'when user is NOT signed in' do
      it 'does not assign @word' do 
        expect(assigns(:word)).to eq(nil)
      end
      it do
        subject
        expect(response).to have_http_status(302)
      end
    end

  end
  
  describe 'Put update' do
    subject { put :update, params: params }
    
    let!(:word) { FactoryBot.create(:word, user: user, content: 'cat', language: language_1) }
    let!(:language_1){ FactoryBot.create(:language, name: 'English') }
    let!(:language_2){ FactoryBot.create(:language, name: 'Polish') }
    let(:user) { FactoryBot.create(:user) }
    
    context 'when user is signed in' do

      
      before do
        sign_in(user)
      end

      context 'valid params' do
        let(:params) do
          {id: word, word: { content: 'kot', language_id: language_2.id } } 
        end  
        it 'updates word' do
          expect { subject }
            .to change {word.reload.content}
            .from('cat')
            .to('kot')
            .and change {word.reload.language}
            .from(language_1)
            .to(language_2)
        end
      end 
       
      context 'invalid params' do
        let(:params) do
          {id: word, word: { content: '' } } 
        end 

        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end
      end
    end
    
    context 'when user is NOT signed in' do

      context 'valid params' do
        let(:params) do
          {id: word, word: { content: 'kot', language_id: language_2.id } } 
        end  

        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end
      end 
       
      context 'invalid params' do
        let(:params) do
          {id: word, word: { content: '' } } 
        end 

        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end
      end
    end

    

  end
  
  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    
    let!(:word) { FactoryBot.create(:word, user: user) }
    let(:user) { FactoryBot.create(:user) }
    
    context 'when user is signed in' do

      
      before do
        sign_in(user)
      end
      context 'valid params' do
        let(:params) do
          {id: word.id }
        end  
        it 'delete word' do
          expect { subject }.to change(Word, :count).from(1).to(0)
        end
      end 
    end
    
    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          {id: word.id }
        end  
        it ' does not delete word' do
          expect { subject }.not_to change(Word, :count)
        end
      end 
    end
  end
end
