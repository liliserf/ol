require 'rails_helper'

describe "Business API" do

  before(:each) do
    FactoryGirl.create_list(:business, Business.default_per_page + 1)
  end

  it "paginates lists of more than 50 businesses" do
    get '/api/businesses?page=2'

    expect(response).to be_success
    expect(json['businesses'].length).to eq(1)
  end

  it "retrieves a specific business by id" do
    biz = Business.last
    get "/api/businesses/#{biz.id}"
    
    expect(response).to be_success
    expect(json['id']).to eq(biz.id)
  end
end