class CreatePostReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reactions do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :kind_of_reaction, null: false, default: 0

      t.timestamps
    end
  end
end
