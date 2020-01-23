class CreateWizards < ActiveRecord::Migration[5.1]
  def change
    create_table :wizards do |t|
      t.string :fname
      t.string :lname
      t.integer :house_id
      t.integer :school_id

      t.timestamps
    end
  end
end
