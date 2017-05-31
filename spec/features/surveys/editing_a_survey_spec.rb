require "rails_helper"

describe "surveys" do
  it "a user can edit a survey" do
    user = create(:user)
    survey = create(:survey, name: "ABC Survey", author: user)

    sign_in(user)
    visit surveys_path

    click_link "ABC Survey"
    click_link "Edit This Survey"
    fill_in "Name",  with: "XYZ Survey"
    click_button "Update Survey"

    expect(page).to have_content("Surveys")
    expect(page).to have_content("XYZ Survey")
    expect(page).not_to have_content("ABC Survey")
  end
end
