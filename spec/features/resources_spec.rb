require "rails_helper"

describe "resources" do
  it "allows user to see resource panel" do
    user = create(:user)
    login_as user
    visit root_path

    expect(page).to have_content("Resources")
    click_link "Resources"

    expect(page).to have_css("h1", text: "Resources")
    expect(current_path).to eq(resources_path)
  end
end
