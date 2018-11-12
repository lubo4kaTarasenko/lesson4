class User < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, :minimum => 2
  validates :password, presence: true
  validates_length_of :password, :minimum => 6
  attr_accessor :name, :password
end
