class Patient < ApplicationRecord
  validates_presence_of :name, :age
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients


  def oldest_to_youngest
    order(age: :desc).pluck(:name)
  end
end