class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nome
      t.string :email
      t.references :kind, index: true
      t.text :rmk

      t.timestamps null: false
    end
  end
end
