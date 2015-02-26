require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET new' do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end 

    it 'renders the new view file' do
      get :new
      expect(response).to render_template :new
    end 

    it 'assigns a new user to a variable user' do
      get :new
      expect( assigns(:user) ).to be_a(User) 
    end 

    it 'does not save any new records' do
      get :new
      expect{ get :new }.to change(User, :count).by(0)
    end 

  end 

  describe 'POST create' do

    context 'when form is valid' do
      let!(:valid_attributes) do
        { first_name: 'Bob', last_name: 'Smith', email: 'bob@gmail.com', password: 'password', password_confirmation: 'password' }
      end

      it 'adds a new user record' do
        expect{ post :create, user: valid_attributes }.to change(User, :count).by(1)
      end 

      it 'redirects to the index view' do 
        post :create, user: valid_attributes
        expect(response).to redirect_to root_path
      end 
    end 

    context 'when form is invalid' do
      let!(:invalid_attributes) do
        { first_name: 'Bob', last_name: 'Smith', email: 'bob@gmail.com', password: 'password', password_confirmation: nil }
      end 

      it 'does not add a new user record' do
        expect{ post :create, user: invalid_attributes }.to change(User, :count).by(0)
      end 

      it 'renders the new view file' do
        post :create, user: invalid_attributes
        expect(response).to redirect_to root_path
      end 
    end 

  end 

end
