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
    before do
      user = create(:user, role: "team")
      login_as user
    end

    it "you can not see the list of users" do
      visit users_path

      expect(page).to have_content("Only admins can access that functionality.")
      expect(page).to_not have_css("table#all_users")
    end
  end

  context "When logged in as an intern" do
    before do
      user = create(:user, role: "intern")
      login_as user
    end

    it "you can not see the list of users" do
      visit users_path

      expect(page).to have_content("Only admins can access that functionality.")
      expect(page).to_not have_css("table#all_users")
    end
  end

  context "When logged in as an unassigned user" do
    before do
      user = create(:user, role: "unassigned")
      login_as user
    end

    it "you can not see the list of users" do
      visit users_path

      expect(page).to have_content("Only admins can access that functionality.")
      expect(page).to_not have_css("table#all_users")
    end
  end

  context "When not logged in" do
    it "you can not see the list of users" do
      visit users_path

      expect(page).to have_content("You need to sign in or sign up")
      expect(page).to_not have_css("table#all_users")
    end
  end
end
