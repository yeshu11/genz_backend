class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :status
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
