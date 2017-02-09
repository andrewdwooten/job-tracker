class AddsCategoryToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :category
  end
end
