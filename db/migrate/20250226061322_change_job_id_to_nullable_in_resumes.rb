class ChangeJobIdToNullableInResumes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :resumes, :job_id, true
  end
end
