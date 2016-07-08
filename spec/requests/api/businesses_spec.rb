require 'rails_helper'

describe "Business API" do

  before(:each) do
    FactoryGirl.create_list(:business, Business.default_per_page + 1)
  end

  context "unauthorized request" do
    it "returns a 401 error and message if token is incorrect" do
      get '/api/businesses?page=2', nil, {"HTTP_AUTHORIZATION" => "Token token=bad_token"}
      expect(response).to_not be_success
    end

    it "returns a 401 error and message if token is not provided" do
      get '/api/businesses?page=2', nil, {"HTTP_AUTHORIZATION" => "Token token="}
      expect(response).to_not be_success
    end
  end

  context "authorized request" do
    let!(:token) do
      ApiKey.create.access_token
    end

    it "paginates lists of more than 50 businesses" do
      get '/api/businesses?page=2', nil, {"HTTP_AUTHORIZATION" => "Token token=#{token}"}
      expect(response).to be_success
      expect(json['businesses'].length).to eq(1)
    end

    it "retrieves a specific business by id" do
      biz = Business.last
      get "/api/businesses/#{biz.id}", nil, {"HTTP_AUTHORIZATION" => "Token token=#{token}"}
      
      expect(response).to be_success
      expect(json['id']).to eq(biz.id)
    end
  end
end