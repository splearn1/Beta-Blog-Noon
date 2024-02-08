require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /blogs" do
    
    let(:blog) { create(:blog) }

    before do 
      blog
      get '/blogs'
    end

    it "returns http success" do 
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of blogs' do 
      expect(response.body).to eq(Blog.all.to_json)
    end

  end

  describe "POST /blogs" do
 
  end

  describe "show /blogs/:id" do 

  end

end
