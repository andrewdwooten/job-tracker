require 'rails_helper'

feature 'user edits a category' do
  scenario 'user accesses edit page for category from index' do
    cat = Category.create(title: 'Test')

    visit categories_path
    click_button 'Edit Category'

    expect(current_path).to eq edit_category_path(cat)
    expect(page).to have_content('Edit Category: Test')
  end

  scenario 'user updates category' do
    cat = Category.create(title: 'Web Dev')

    visit edit_category_path(cat)

    fill_in 'category[title]', with: 'Edit Test'

    expect { click_button "Update Category"}.to change(Category, :count).by(0)
    expect(current_path).to eq category_path(cat)
    expect(page).to have_content('Edit Test')
    expect(page).to_not have_content('Web Dev')
  end


end
