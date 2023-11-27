require 'rails_helper'

RSpec.describe "currencies/edit", type: :view do
  let(:currency) {
    Currency.create!(
      name: "MyString",
      code: "MyString",
      rate: 1.5
    )
  }

  before(:each) do
    assign(:currency, currency)
  end

  it "renders the edit currency form" do
    render

    assert_select "form[action=?][method=?]", currency_path(currency), "post" do

      assert_select "input[name=?]", "currency[name]"

      assert_select "input[name=?]", "currency[code]"

      assert_select "input[name=?]", "currency[rate]"
    end
  end
end
