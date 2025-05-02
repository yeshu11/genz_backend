class CreateSolidQueueProcesses < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_processes, force: :cascade do |t|
      t.string :kind, null: false
      t.bigint :last_heartbeat_at, null: false
      t.string :name, null: false
      t.text :supervisor_key
      t.datetime :created_at, null: false
      t.index [:last_heartbeat_at], name: "index_solid_queue_processes_on_last_heartbeat_at"
      t.index [:name], name: "index_solid_queue_processes_on_name", unique: true
      t.index [:supervisor_key], name: "index_solid_queue_processes_on_supervisor_key"
    end
  end
end
