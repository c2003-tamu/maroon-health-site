require "rails_helper"

RSpec.describe MemberShiftsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/member_shifts").to route_to("member_shifts#index")
    end

    it "routes to #new" do
      expect(get: "/member_shifts/new").to route_to("member_shifts#new")
    end

    it "routes to #show" do
      expect(get: "/member_shifts/1").to route_to("member_shifts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/member_shifts/1/edit").to route_to("member_shifts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/member_shifts").to route_to("member_shifts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/member_shifts/1").to route_to("member_shifts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/member_shifts/1").to route_to("member_shifts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/member_shifts/1").to route_to("member_shifts#destroy", id: "1")
    end
  end
end
