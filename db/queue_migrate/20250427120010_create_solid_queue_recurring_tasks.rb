class CreateSolidQueueRecurringTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_recurring_tasks, force: :cascade do |t|
      t.string :key, null: false
      t.string :schedule, null: false
      t.string :command
      t.string :class_name
      t.text :arguments
      t.string :queue_name
      t.integer :priority, default: 0, null: false
      t.datetime :created_at, null: false
      t.index [:key], name: "index_solid_queue_recurring_tasks_on_key", unique: true
    end
  end
end
