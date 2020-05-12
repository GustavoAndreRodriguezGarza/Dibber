class AddClonedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :cloned, :integer
  end
end
