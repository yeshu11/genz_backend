class CreateSolidQueuePauses < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_pauses, force: :cascade do |t|
      t.string :queue_name, null: false
      t.datetime :created_at, null: false
      t.index [:queue_name], name: "index_solid_queue_pauses_on_queue_name", unique: true
    end
  end
end
