class CreateResumeCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :resume_categories do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
