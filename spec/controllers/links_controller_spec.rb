require 'rails_helper'
require 'securerandom'

RSpec.describe LinksController, type: :controller do

  describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

  # describe "GET #new" do
  #   it "returns http success" do

  #     get :new
  #     expect(response).to have_http_status(:success)
  #     # expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST #create" do
    # not actually using
    # it "redirects to links#new" do
    #   post :create, params: {link: {original_url: 'https://google.com', token: SecureRandom.hex(3)}}
    #   expect(response).to redirect_to(new_link_path)
    # end

    it "calls to create.js.erb" do
      post :create, params: {link: {original_url: 'https://google.com', token: SecureRandom.hex(3)}}, xhr: true
      expect(response.content_type).to eq("text/javascript")
      expect(response).to have_http_status(:success) 
    end
  end

  describe "GET #show" do
    it "returns http success" do
      link = Link.create(original_url: 'https://google.com', token: SecureRandom.hex(3))
      get :show, params: {token: link.token}
      expect(response).to redirect_to(link.original_url)
    end
  end

end
