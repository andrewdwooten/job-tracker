require 'rails_helper'

  feature 'user adds a contact to a company' do
    scenario 'user visits a company page and adds a contact' do
      company = Company.create(name: 'Test')

      visit company_path(company)

      fill_in 'contact[name]', with: 'Frank'
      fill_in 'contact[position]', with: 'Senior Dev'
      fill_in 'contact[email]', with: 'frank@place.com'

      expect { click_button 'Create Contact'}.to change(Contact, :count).by(1)

      expect(current_path).to eq company_jobs_path(company)
      expect(page).to have_content('Frank')
      expect(page).to have_content('Senior Dev')
      expect(page).to have_content('frank@place.com')
    end
  end
