class CreateSolidQueueReadyExecutions < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_ready_executions, force: :cascade do |t|
      t.bigint :job_id, null: false
      t.string :queue_name, null: false
      t.integer :priority, default: 0, null: false
      t.datetime :created_at, null: false
      t.index [:job_id], name: "index_solid_queue_ready_executions_on_job_id", unique: true
      t.index [:priority, :job_id], name: "index_solid_queue_ready_executions_on_priority_and_job_id"
      t.index [:queue_name, :priority, :job_id], name: "index_solid_queue_ready_executions_for_dequeue"
    end
    add_foreign_key :solid_queue_ready_executions, :solid_queue_jobs, column: :job_id, on_delete: :cascade
  end
end
