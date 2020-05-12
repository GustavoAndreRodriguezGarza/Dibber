class AddTimestampToArticles < ActiveRecord::Migration[5.1]
  def change
    # add new column but allow null values

  # backfill existing record with created_at and updated_at
    # values making clear that the records are faked
    long_ago = DateTime.new(2000, 1, 1)
    Post.update_all(created_at: long_ago, updated_at: long_ago)
  # change not null constraints
    change_column_null :posts, :created_at, false
    change_column_null :posts, :updated_at, false
  end
  end
