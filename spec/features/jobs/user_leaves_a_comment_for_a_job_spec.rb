require 'rails_helper'

describe 'User adds a comment to a job' do
  context 'with valid inputs' do
    scenario 'user is redirected to job show page' do
      company = Company.create(name: "Test")
      cat = Category.create(title: 'Test')
      job = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: cat.id)

      visit company_job_path(company, job)

      fill_in 'comment[content]', with: 'Test comment'
      click_button 'Add Comment'

      expect(current_path).to eq company_job_path(company, job)
      expect(page).to have_content("Test comment")
    end
  end
end
