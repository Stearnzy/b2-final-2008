class RemoveDoctorFromPatients < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :doctor_id
  end
end
