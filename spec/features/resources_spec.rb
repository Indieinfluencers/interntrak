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
    type = create(:type, title: "Tutorial", resources: [resource])
    resource_2 = create(:resource, title: "Different", description: "Otherness")
    create(:topic, resources: [resource_2])
    create(:type, title: "Game", resources: [resource_2])

    login_as user
    visit root_path

    click_link "Resources"

    expect(current_path).to eq(resources_path)

    click_link "Tutorial"

    expect(current_path).to eq(type_path(type))
    expect(page).to have_content(resource.title)
    expect(page).to have_content(resource.description)
    expect(page).not_to have_content(resource_2.title)
    expect(page).not_to have_content(resource_2.description)
  end
end
