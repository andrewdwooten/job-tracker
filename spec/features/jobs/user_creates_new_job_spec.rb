require 'rails_helper'

describe "User creates a new job" do
    context "without category selection" do
        scenario "user is redirected to new job page" do
          company = Company.create!(name: "ESPN")
          visit new_company_job_path(company)

          fill_in "job[title]", with: "Developer"
          fill_in "job[description]", with: "So fun!"
          fill_in "job[level_of_interest]", with: 80
          fill_in "job[city]", with: "Denver"
          click_button "Create"

          expect(current_path).to eq new_company_job_path(company)
          expect(page).to have_field('job_title')
          expect(page).to have_field('job_city')
          expect(page).to have_field('job_description')
        end
    end
  context "with category selection" do
    scenario "a user can create a new job" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: 'Test')
      visit new_company_job_path(company)

      fill_in "job[title]", with: "Developer"
      fill_in "job[description]", with: "So fun!"
      fill_in "job[level_of_interest]", with: 80
      fill_in "job[city]", with: "Denver"
      select 'Test', from: "job[category_id]"
      click_button "Create"

      expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Developer")
      expect(page).to have_content("80")
      expect(page).to have_content("Denver")
    end
  end


  scenario 'a user sees a link to create a category on new job page' do
    company = Company.create(name: "Test")
    visit new_company_job_path(company)

    expect(page).to have_link("Create New Category")

    click_link "Create New Category"

    expect(current_path).to eq new_category_path
  end
end
