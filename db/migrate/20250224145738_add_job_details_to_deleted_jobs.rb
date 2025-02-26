class AddJobDetailsToDeletedJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :deleted_jobs, :title, :string
    add_column :deleted_jobs, :location, :string
    add_column :deleted_jobs, :description, :text
  end
end
