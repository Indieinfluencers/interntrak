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

  it "displays all resources of a specific type" do
    user = create(:user)
    resource = create(:resource)
    topic = create(:topic, resources: [resource])
    type = create(:type, resources: [resource])

    login_as user
    visit root_path

    click_link "Resources"

    expect(current_path).to eq(resources_path)

    click_link "Tutorial"

    expect(current_path).to eq(type_path(type))
    expect(page).to have_content(type.title)
    expect(page).to have_content(resource.description)
  end
end
