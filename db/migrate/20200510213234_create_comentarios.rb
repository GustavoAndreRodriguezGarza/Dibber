class CreateComentarios < ActiveRecord::Migration[6.0]
  def change
    create_table :comentarios do |t|
      t.text :texto
      t.integer :compartir
      t.integer :likes
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
