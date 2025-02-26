class AddDeletedJobIdToResumes < ActiveRecord::Migration[8.0]
  def change
    add_column :resumes, :deleted_job_id, :integer
  end
end
