class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :type
      t.references :city
      t.references :governorate
      
      t.timestamps
    end
  end
end
