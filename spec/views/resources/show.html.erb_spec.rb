require 'rails_helper'

RSpec.describe "resources/show", type: :view do
  before(:each) do
    assign(:resource, Resource.create!(
      url: "Url",
      title: "Title",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
