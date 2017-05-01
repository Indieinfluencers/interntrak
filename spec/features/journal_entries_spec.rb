require "rails_helper"

describe "A journal entry" do
  it "a user can create a journal entry" do
    user = create(:user)
    login_as user

    visit new_journal_entry_path
    select Date.today.year, from: :journal_entry_date_for_1i
    # Select today's month by the name
    select Date::MONTHNAMES[Date.today.month], from: :journal_entry_date_for_2i
    select Date.today.day, from: :journal_entry_date_for_3i
    fill_in :journal_entry_content, with: "Day 1: No apparent signs of life"
    click_on "Create Journal entry"

    entry = user.journal_entries.last

    expect(entry.date_for).to eq(Date.today)
    expect(entry.content).to eq("Day 1: No apparent signs of life")
    expect(entry.author).to eq(user)
  end

  it "a user can edit a journal entry" do
    entry = create(:journal_entry, date_for: Date.today)
    login_as entry.author

    visit edit_journal_entry_path(entry)
    select Date.tomorrow.day, from: :journal_entry_date_for_3i
    fill_in :journal_entry_content, with: "Day 2: I found food!"
    click_on "Update Journal entry"

    expect(entry.reload.date_for).to eq(Date.tomorrow)
    expect(entry.content).to eq("Day 2: I found food!")
  end

  it "a user can view a journal entry" do
    entry = create(:journal_entry)
    login_as entry.author

    visit journal_entry_path(entry)
    expect(page).to have_content(entry.date_for)
    expect(page).to have_content(entry.content)
  end
end
