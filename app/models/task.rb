class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates_length_of :description, :minimum => 5, :message => 'should minimum 5 characters'
  validates :expire_at, inclusion: { in: (Date.today..Date.today+5.years), :message => 'should be later than now' }
  enum status: [0, 1]
  after_initialize :set_default_status

  def set_default_status
    self.status ||= 0
  end
end
