class AddStatusToDeletedJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :deleted_jobs, :status, :string
  end
end
