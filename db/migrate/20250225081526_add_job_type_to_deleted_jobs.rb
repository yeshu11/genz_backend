class AddJobTypeToDeletedJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :deleted_jobs, :job_type, :string
  end
end
