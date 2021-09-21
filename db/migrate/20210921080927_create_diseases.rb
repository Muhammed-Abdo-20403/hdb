class CreateDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :diseases do |t|

      t.timestamps
    end
  end
end
