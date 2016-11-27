class CreateListMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :list_members do |t|
      t.integer :list_id
      t.integer :member_id

      t.timestamps
    end
  end
end
