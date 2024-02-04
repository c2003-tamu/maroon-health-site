require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      role: Role.create!(name: 'Volunteer'),
      first_name: "First Name",
      last_name: "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
