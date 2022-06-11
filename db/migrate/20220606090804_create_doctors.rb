class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.string :phone
      t.integer :age
      t.string :email
      t.boolean :gender
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
