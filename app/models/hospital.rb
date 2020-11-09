class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doc_count
    doctors.count
  end

  def alma_maters
    doctors.distinct.pluck(:university)
  end
end