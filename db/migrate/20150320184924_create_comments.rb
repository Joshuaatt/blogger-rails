class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :blog, true
      t.column :comment_body, :text

      t.timestamps
    end
    add_foreign_key :comments, :blogs
  end
end
