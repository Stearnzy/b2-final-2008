class Patient < ApplicationRecord
  validates_presence_of :name, :age
  belongs_to :doctor

  def oldest_to_youngest
    order(age: :desc).pluck(:name)
  end

  def o
    order(:age)
  end
end