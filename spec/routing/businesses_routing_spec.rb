require "rails_helper"

RSpec.describe Api::BusinessesController, type: :routing do
  describe "routing" do
    describe "index" do
      it "routes GET /api/businesses" do
        expect(
          get: "/api/businesses"
        ).to route_to controller: "api/businesses",
                      action:     "index"
      end
    end

    describe "show" do
      let(:business_id) { 1 }

      it "routes GET /api/businesses/:id" do
        expect(
          get: "/api/businesses/#{business_id}"
        ).to route_to controller: "api/businesses",
                      action:     "show",
                      id:         business_id.to_s
      end
    end
  end
end
