class Resume < ApplicationRecord
  belongs_to :job, optional: true
  belongs_to :deleted_job, optional: true # Add association for deleted jobs
  has_one_attached :resume_file
end
