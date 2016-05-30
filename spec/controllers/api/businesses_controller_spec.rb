require 'rails_helper'

RSpec.describe Api::BusinessesController, type: :controller do
  describe "GET #index" do
    before(:each) do
      allow(Business).to receive(:default_per_page).and_return(1)
      FactoryGirl.create_list :business, Business.default_per_page + 1
    end
    
    context "paginates records" do
      it "returns first page of business records by default" do
        get :index
        expect(json["meta"]["pagination"]["current_page"]).to eq(1)
        expect(response.status).to eq(200)
      end

      it "returns the requested page from the param" do
        get :index, { page: 2 }
        expect(json["meta"]["pagination"]["current_page"]).to eq(2)
        expect(response.status).to eq(200)
      end
      
      it "returns pagination meta data" do
        get :index, { page: 2 }
        expect(json["meta"]["pagination"]["per_page"]).to eq Business.default_per_page
        expect(json["meta"]["pagination"]["total_pages"]).to eq 2
        expect(json["meta"]["pagination"]["total_businesses"]).to eq Business.all.count
      end

      it "returns 404 error and message if page does not exist" do
        get :index, { page: 6 }
        expect(json["errors"]).to eq "Requested page exceeds record pagination."
        expect(response.status).to eq(404)
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @business = FactoryGirl.create :business
    end

    it "returns the right object" do
      get :show, { id: @business.id }
      expect(response.status).to eq(200)
      expect(json['id']).to eql(@business.id)
    end

    it "returns 404 error and message if business id does not exist" do
      @business.id = 6
      get :show, { id: 7 }
      expect(json["errors"]).to eq "Unable to find business by that id."
      expect(response.status).to eq(404)
    end
  end
end