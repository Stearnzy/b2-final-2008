class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:id])
    dp = DoctorPatient.find_by(doctor: params[:id], patient: params[:patient_id])
    DoctorPatient.destroy(dp.id)
    redirect_to "/doctors/#{doctor.id}"
  end
end