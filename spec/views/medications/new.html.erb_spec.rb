require 'rails_helper'

RSpec.describe "medications/new", type: :view do
  before(:each) do
    assign(:medication, Medication.new(
      name: "MyString",
      stock: 1,
      notes: "MyString"
    ))
  end

  it "renders new medication form" do
    render

    assert_select "form[action=?][method=?]", medications_path, "post" do

      assert_select "input[name=?]", "medication[name]"

      assert_select "input[name=?]", "medication[stock]"

      assert_select "input[name=?]", "medication[notes]"
    end
  end
end
