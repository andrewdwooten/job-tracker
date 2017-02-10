require 'rails_helper'

feature 'user deletes a category' do
  scenario 'user deletes a category from index page and sees updated index' do
    Category.create(title: 'Test 1')


    visit categories_path

    expect { click_button "Delete Category"}.to change(Category, :count).by(-1)

    expect(current_path).to eq categories_path
    expect(page).to_not have_content('Test 1')
  end
end
