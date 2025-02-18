class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :resume_file
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
