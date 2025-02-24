class Resume < ApplicationRecord
  belongs_to :job
  has_one_attached :resume_file
end
