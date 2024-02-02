require 'rails_helper'

RSpec.describe "member_shifts/edit", type: :view do
  let(:member_shift) {
    MemberShift.create!(
      title: "MyString",
      ideal_volunteers: 1,
      ideal_officers: 1
    )
  }

  before(:each) do
    assign(:member_shift, member_shift)
  end

  it "renders the edit member_shift form" do
    render

    assert_select "form[action=?][method=?]", member_shift_path(member_shift), "post" do

      assert_select "input[name=?]", "member_shift[title]"

      assert_select "input[name=?]", "member_shift[ideal_volunteers]"

      assert_select "input[name=?]", "member_shift[ideal_officers]"
    end
  end
end
