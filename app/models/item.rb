class Item < ActiveRecord::Base
  belongs_to :produto
  belongs_to :pedido

  def preco_total
    self.quantidade * self.produto.preco
  end
 end