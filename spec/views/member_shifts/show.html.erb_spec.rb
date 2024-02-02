require 'rails_helper'

RSpec.describe "member_shifts/show", type: :view do
  before(:each) do
    assign(:member_shift, MemberShift.create!(
      title: "Title",
      ideal_volunteers: 2,
      ideal_officers: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
