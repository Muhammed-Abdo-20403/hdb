class CreateDoctorsPerHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors_per_hospitals do |t|
      t.references :hospital
      t.references :doctor
      
      t.timestamps
    end
  end
end
