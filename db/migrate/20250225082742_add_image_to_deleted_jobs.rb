class AddImageToDeletedJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :deleted_jobs, :image, :string
  end
end
