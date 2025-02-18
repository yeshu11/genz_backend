class AddJobTypeToJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :jobs, :job_type, :string
  end
end
