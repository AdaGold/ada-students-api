class Student < ApplicationRecord
  validates :fullName, presence: true
  validates :email, presence: true, uniqueness: true
end
