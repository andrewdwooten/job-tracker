require 'rails_helper'

describe 'User edits a job' do
  context 'with valid params' do
    scenario 'a user can edit a job' do

      company = Company.create(name: "Apple")
      cat = Category.create(title: "Test")
      job = company.jobs.create(title: 'Web Developer',
                                level_of_interest: 8,
                                city: 'Denver',
                                description: 'Awesome Stuff',
                                category_id: cat.id)

      visit edit_company_job_path(company, job)
      fill_in 'job[title]', with: 'Awesome Developer'
      fill_in 'job[city]',  with: 'Cupertino'
      fill_in 'job[description]', with: 'Cool things'
      click_button "Update Job"

      expect(current_path).to eq company_job_path(company, job)
      expect(page).to have_content('Awesome Developer')
      expect(page).to have_content('Cupertino')
      expect(page).to have_content('Cool things')
      expect(page).to_not have_content('Web Developer')
      expect(page).to_not have_content('Denver')
      expect(page).to_not have_content('Awesome Stuff')
    end
  end
    context 'with invalid params' do
      scenario 'a user cannot edit to invalid params' do
        cat = Category.create(title: "Test")
        company = Company.create(name: "Apple")
        job = company.jobs.create(title: 'Web Developer',
                                  level_of_interest: 8,
                                  city: 'Denver',
                                  description: 'Awesome Stuff',
                                  category_id: cat.id)

        visit edit_company_job_path(company, job)
        fill_in 'job[title]', with: ''
        fill_in 'job[city]',  with: ''
        fill_in 'job[description]', with: ''
        click_button "Update"

        expect(current_path).to eq edit_company_job_path(company, job)
        expect(page).to have_field('job_title', with: 'Web Developer')
        expect(page).to have_field('job_city', with: 'Denver')
        expect(page).to have_field('job_description', with: 'Awesome Stuff')
      end
  end
end
