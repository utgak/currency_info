require 'rails_helper'

RSpec.describe "currencies/show", type: :view do
  before(:each) do
    assign(:currency, Currency.create!(
      name: "Name",
      code: "Code",
      rate: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/2.5/)
  end
end
