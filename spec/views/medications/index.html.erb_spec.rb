require 'rails_helper'

RSpec.describe "medications/index", type: :view do
  
  it "validates sunny day of medications" do
    medication = Medication.new(name: "test", stock: 0, notes: "note")
    expect(medication).to be_valid
  end

  it "does not validate negative stock for initialization" do
    medication = Medication.new(name: "test", stock: -1, notes: "")
    expect(medication).to_not be_valid
  end 

end
