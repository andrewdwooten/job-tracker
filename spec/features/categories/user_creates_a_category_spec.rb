require 'rails_helper'

feature 'user creates a category' do
  context 'category does not yet exist' do
    scenario 'user creates a category and sees the category page' do

      visit new_category_path
      fill_in 'category[title]', with: 'Test'

      expect { click_button "Create Category"}.to change(Category, :count).by(+1)

      expect(current_path).to eq category_path(Category.last.id)
      expect(page).to have_content("Category: Test")
    end
  end

  context 'category already exisits' do
    scenario 'user is redirected to new category page if category exists' do
      Category.create(title: 'Web Development')

      visit new_category_path
      fill_in 'category[title]', with: 'Web Development'

      expect { click_button "Create Category"}.to change(Category, :count).by(0)

      expect(current_path).to eq new_category_path
    end
  end
end
