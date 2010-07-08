class CriarProdutos < ActiveRecord::Migration
  def self.up

    create_table :produtos do |t|
      t.string :nome, :null => false, :limit => 100
      t.text   :descricao
      t.decimal:preco, :precision => 10, :scale => 2, :null => false
      t.timestamps 
    end

    #add_index :produtos, [:nome, :preco], unique => true

  end

  def self.down
    drop_table :produtos
  end
end
