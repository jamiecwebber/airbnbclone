class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :owner, default: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :photos
      t.string :bio

      t.timestamps
    end
  end
end
