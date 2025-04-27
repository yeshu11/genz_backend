class CreateSolidQueueSemaphores < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_semaphores, force: :cascade do |t|
      t.string :key, null: false
      t.integer :value, null: false
      t.datetime :expires_at, null: false
      t.datetime :created_at, null: false
      t.index [:key], name: "index_solid_queue_semaphores_on_key", unique: true
    end
  end
end
