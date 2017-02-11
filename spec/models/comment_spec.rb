require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        cat = Category.create(title: "Test")
        job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: cat.id)
        comment = job.comments.new()
        expect(comment).to be_invalid
      end

      it 'is invalid without an associated job' do
        comment = Comment.new(content: 'test')
        expect(comment).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'is valid with both content and associated job' do
        cat = Category.create(title: "Test")
        job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: cat.id)
        comment = job.comments.new(content: "Test")
        expect(comment).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      cat = Category.create(title: "Test")
      job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: cat.id)
      comment = job.comments.create(content: "Test")
      expect(comment).to respond_to(:job)
    end
  end
end
