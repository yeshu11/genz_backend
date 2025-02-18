class ResumeCategory < ApplicationRecord
  belongs_to :resume
  belongs_to :category
end
