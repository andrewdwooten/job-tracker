require 'rails_helper'

feature "user views all categories on index page" do
  scenario "user visits categories index and can see all categories" do
    cat1 = Category.create(title: 'Test 1')
    cat2 = Category.create(title: 'Test 2')
    cat3 = Category.create(title: 'Test 3')

    visit categories_path

    expect(page).to have_link('Test 1', href: category_path(cat1))
    expect(page).to have_link('Test 2', href: category_path(cat2))
    expect(page).to have_link('Test 3', href: category_path(cat3))
  end
end
