class RemoveResumeFileFromResumes < ActiveRecord::Migration[8.0]
  def change
    remove_column :resumes, :resume_file, :string
  end
end
