class CreateDeletedJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :deleted_jobs do |t|
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
