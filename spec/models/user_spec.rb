require "rails_helper"

RSpec.describe User do
  describe "admin?" do
    it "evaluates to true if the user has the admin role" do
      user = build(:user, role: "admin")

      expect(user.admin?).to eq(true)
    end

    it "evaluates to false if the user doesn't have the admin role" do
      team_user = build(:user, role: "team")
      intern_user = build(:user, role: "intern")
      unassigned_user = build(:user, role: "unassigned")

      expect(team_user.admin?).to eq(false)
      expect(intern_user.admin?).to eq(false)
      expect(unassigned_user.admin?).to eq(false)
    end
  end

  describe "intern?" do
    it "evaluates to true if the user has the intern role" do
      user = build(:user, role: "intern")

      expect(user.intern?).to eq(true)
    end

    it "evaluates to false if the user doesn't have the intern role" do
      team_user = build(:user, role: "team")
      admin_user = build(:user, role: "admin")
      unassigned_user = build(:user, role: "unassigned")

      expect(team_user.intern?).to eq(false)
      expect(admin_user.intern?).to eq(false)
      expect(unassigned_user.intern?).to eq(false)
    end
  end
end
