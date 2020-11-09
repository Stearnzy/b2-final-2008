class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @patients_sorted = @patients.order(age: :desc).pluck(:name)
  end
end