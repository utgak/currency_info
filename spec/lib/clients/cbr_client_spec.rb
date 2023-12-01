require "rails_helper"

RSpec.describe CbrClient do
  let(:test_client) { described_class.new }
  specify '#daily' do
    stub_request(:get, "http://www.cbr.ru/scripts/XML_daily.asp?date_req=30/11/2023").
      to_return(status: 200, body: "daily", headers: {})
    response = test_client.daily(Date.yesterday)
    expect(response).to eq "daily"
  end

  specify '#dynamic' do
    stub_request(:get, "http://www.cbr.ru/scripts/XML_dynamic.asp?VAL_NM_RQ=R01239&date_req1=01/10/2023&date_req2=01/12/2023").
      to_return(status: 200, body: "dynamic", headers: {})
    
    response = test_client.dynamic(2.month.ago.to_date, Date.current, 'R01239')
    expect(response).to eq "dynamic"
  end
end
