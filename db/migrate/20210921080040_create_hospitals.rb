class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.references :city
      t.string :type
      t.timestamps
    end
  end
end