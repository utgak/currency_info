require "rails_helper"

RSpec.describe CurrenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/currencies").to route_to("currencies#index")
    end

    it "routes to #new" do
      expect(get: "/").to route_to("currencies#history")
    end
  end
end
