require "rails_helper"

describe "A journal entry" do
  context "When logged in as an intern" do
    before do
      @user = create(:user, role: "intern")
      login_as @user
    end

    it "a user can create a journal entry" do
      visit new_journal_entry_path
      select Date.today.year, from: :journal_entry_date_for_1i
      select Date::MONTHNAMES[Date.today.month], from: :journal_entry_date_for_2i
      select Date.today.day, from: :journal_entry_date_for_3i
      fill_in :journal_entry_content, with: "Day 1: No apparent signs of life"
      click_on "Create Journal entry"

      entry = @user.journal_entries.last

      expect(entry.date_for).to eq(Date.today)
      expect(entry.content).to eq("Day 1: No apparent signs of life")
      expect(entry.author).to eq(@user)
    end

    it "a user can edit a journal entry" do
      entry = create(:journal_entry, date_for: Date.today, author: @user)

      visit edit_journal_entry_path(entry)

      select Date.tomorrow.year, from: :journal_entry_date_for_1i
      select Date::MONTHNAMES[Date.tomorrow.month], from: :journal_entry_date_for_2i
      select Date.tomorrow.day, from: :journal_entry_date_for_3i
      fill_in :journal_entry_content, with: "Day 2: I found food!"
      click_on "Update Journal entry"

      expect(entry.reload.date_for).to eq(Date.tomorrow)
      expect(entry.content).to eq("Day 2: I found food!")
    end

    it "a user can view a journal entry" do
      entry = create(:journal_entry, author: @user)

      visit journal_entry_path(entry)
      expect(page).to have_content(entry.date_for)
      expect(page).to have_content(entry.content)
    end
  end

  context "When logged in as an admin" do
    before do
      login_as create(:user, role: "admin")
    end

    it "a user can not create a journal entry" do
      visit new_journal_entry_path

      expect(page).to have_content("Only interns can access that functionality.")
    end

    it "a user can not edit a journal entry" do
      other_user = create(:user, role: "intern")
      entry = create(:journal_entry, date_for: Date.today, author: other_user)

      visit edit_journal_entry_path(entry)

      expect(page).to have_content("Only interns can access that functionality.")
    end

    it "a user can view a journal entry" do
      other_user = create(:user, role: "intern")
      entry = create(:journal_entry, author: other_user)

      visit journal_entry_path(entry)

      expect(page).to have_content(entry.date_for)
      expect(page).to have_content(entry.content)
    end
  end

  context "When logged in as a team member" do
    before do
      login_as create(:user, role: "team")
    end

    it "a user can not create a journal entry" do
      visit new_journal_entry_path

      expect(page).to have_content("Only interns can access that functionality.")
    end

    it "a user can not edit a journal entry" do
      other_user = create(:user, role: "intern")
      entry = create(:journal_entry, date_for: Date.today, author: other_user)

      visit edit_journal_entry_path(entry)

      expect(page).to have_content("Only interns can access that functionality.")
    end

    it "a user can not view a journal entry" do
      other_user = create(:user, role: "intern")
      entry = create(:journal_entry, author: other_user)

      visit journal_entry_path(entry)

      expect(page).to have_content("You can not access that functionality.")
    end
  end
end
