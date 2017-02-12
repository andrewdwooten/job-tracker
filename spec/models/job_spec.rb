require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        cat = Category.create(title: "Test")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: cat.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        cat = Category.create(title: "Test")
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: cat.id)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        cat = Category.create(title: "Test")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: cat.id)
        expect(job).to be_invalid
      end

      it "is invalid without a category" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        cat = Category.create(title: "Test")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: cat.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      cat = Category.create(title: "Test")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: cat.id)
      expect(job).to respond_to(:company)
    end

    it "belonds to a category" do
      cat = Category.create(title: "Test")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category_id: cat.id)
      expect(job).to respond_to(:category)
    end
  end
end
