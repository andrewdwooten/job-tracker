require 'rails_helper'

feature 'user views a category' do
  scenario 'user sees all jobs in the category' do
    cat = Category.create(title: 'Test')
    company = Company.create(name: "Apple")
    cat.jobs.create(title: 'Ultra Web Developer',
                    level_of_interest: 8,
                    city: 'Denver',
                    description: 'Awesome Stuff',
                    company_id: company.id)
    cat.jobs.create(title: 'Ninja Web Developer',
                    level_of_interest: 8,
                    city: 'Denver',
                    description: 'Awesome Stuff',
                    company_id: company.id)
    visit category_path(cat)

    expect(page).to have_link('Ultra Web Developer')
    expect(page).to have_link('Ninja Web Developer')
  end
end
