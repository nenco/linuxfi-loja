class CriarPedidosEItens < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.sting :estado, :default => 'carrinho'
      t.timesstamps
    end

    create_table :itens do |t|
      t.integer :produto_id, :null => false
      t.integer :pedido_id, :null => false
      t.integer :quantidade, :null => false
      t.timesstamps
    end

    add_index :itens, :pedido_id
  end

  def self.down
    drop_table :pedidos
    drop_table :itens
  end
end
