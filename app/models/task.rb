class Task < ApplicationRecord
  validates :title, presence: true
  enum status: { new_task: 0, done_task: 1 }
  def is_done
    status == "done_task"
  end

  def is_done=(value)
    if value == '1'
      self.status = 1
    else
      self.status = 0
    end
  end
end
