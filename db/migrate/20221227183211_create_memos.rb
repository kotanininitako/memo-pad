class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :memos }

      t.timestamps
      
      t.index [:id, :parent_id], unique: true
    end
  end
end
