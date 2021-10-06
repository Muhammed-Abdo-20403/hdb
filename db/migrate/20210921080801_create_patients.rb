class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :age
      t.string :sex
      t.references :city
      t.timestamps
    end
  end
end
