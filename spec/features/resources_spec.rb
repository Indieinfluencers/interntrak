require "spec helper"

describe "resources" do
  it "allows user to see resource panel" do
    user = create(:user)
    log_in user
    visit root_path

    expect(page).to have_content("Resources")
    click_link "Resources"

    expect(page).to have_content("Resources Checked Out")
    expect(current_path).to eq(resources_path)
  end
end
