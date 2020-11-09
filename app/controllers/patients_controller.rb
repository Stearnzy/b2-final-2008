class PatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:id])
    patient = Patient.find(params[:patient_id])
    patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end