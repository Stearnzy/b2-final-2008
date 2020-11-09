class CreateHospital < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
    end
  end
end
