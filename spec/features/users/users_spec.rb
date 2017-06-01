require "rails_helper"

describe "Users functionality" do
  context "When logged in as an admin" do
    before do
      user = create(:user, role: "admin")
      login_as user
    end

    it "you can see the list of users" do
      visit users_path

      expect(page).to have_css("table#all_users")
    end
  end

  context "When logged in as a team member" do
  end

  context "When logged in as an intern" do
  end

  context "When logged in as an unassigned user" do
  end

  context "When not logged in" do
  end
end
