class Patient < ApplicationRecord
  validates_presence_of :name, :age
  belongs_to :doctor
end