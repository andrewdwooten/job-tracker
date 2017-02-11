require 'rails_helper'

describe 'User deletes a job' do
  scenario 'a user can delete a job' do
    cat = Category.create(title: 'Test')
    company = Company.create(name: "Apple")
    job = company.jobs.create(title: 'Web Developer',
                              level_of_interest: 8,
                              city: 'Denver',
                              description: 'Awesome Stuff',
                              category_id: cat.id)

    visit company_job_path(company, job)
    expect { click_link "Delete This Job" }.to change(Job, :count).by(-1)


    expect(current_path).to eq company_jobs_path(company)
    expect(page).to_not have_content("Web Developer")
  end
end
