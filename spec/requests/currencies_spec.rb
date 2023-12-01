require 'rails_helper'

RSpec.describe "/currencies", type: :request do
  let!(:currency) { Currency.create!(name: 'Китайский юань', char_code: 'CNY', cbr_id: 'R01375') }
  let!(:history) {
      CurrencyHistory.create!([{:rate=>0.154955e2, date: Date.today.beginning_of_week.weeks_ago(1) + 1, currency: currency},{:rate=>0.134955e2, date: Date.today.end_of_week.weeks_ago(1) - 1, currency: currency}])
    }
  
  describe "GET /index" do
    it "renders a successful response" do
      get currencies_url

      expect(response).to be_successful
    end

    it "renders a currency name" do
      get currencies_url

      expect(response.body).to include currency.name
    end
  end

  describe "GET /" do
    it "renders a successful response" do
      get root_url

      expect(response).to be_successful
    end

    it "prepares a table data" do
      get root_url

      expect(assigns(:currencies)).to eq [{"CNY"=>{:last_week_1=>["-14.82", 0.135e2], :last_week_2=>["0.0", 0.155e2], :last_week_3=>["0.0", 0.155e2], :last_week_4=>["0.0", 0.155e2]}}]
    end
  end
end
