class Task < ApplicationRecord
  enum status: { new_task: 0, done_task: 1 }

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :expire_at, presence: true
  validate :expiration_date_cannot_be_in_the_past


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

  private
  def expiration_date_cannot_be_in_the_past
    if expire_at.present? && expire_at < Date.today
      errors.add(:expire_at, "can't be in the past")
    end
  end
end
