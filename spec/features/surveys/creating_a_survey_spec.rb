require "rails_helper"

describe "surveys" do
  it "a user can create a survey" do
    user = create(:user)
    sign_in(user)

    visit new_survey_path

    fill_in "Name",         with: "How Are Things?"
    fill_in "Description",  with: "Tell me how you feel about things"
    click_button "Create Survey"

    survey = Survey.last

    expect(survey.name).to eq("How Are Things?")
    expect(survey.description).to eq("Tell me how you feel about things")
    expect(survey.active).to be true
    expect(survey.author).to eq(user)
  end
end
