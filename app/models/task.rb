class Task < ApplicationRecord
  belongs_to :task_list

  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: ["not started", "in progress", "under review", "done"] }
end
