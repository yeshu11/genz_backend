class ModifyDeletedJobsForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :deleted_jobs, :jobs
    add_foreign_key :deleted_jobs, :jobs, on_delete: :nullify
    change_column_null :deleted_jobs, :job_id, true
  end
end
