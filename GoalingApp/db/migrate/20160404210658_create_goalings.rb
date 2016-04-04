class CreateGoalings < ActiveRecord::Migration
  def change
    create_table :goalings do |t|
      t.string :title, null: false
      t.string :private_public, default: "private"
      t.string :completion, default: "incomplete"
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :goalings, :user_id
  end
end
