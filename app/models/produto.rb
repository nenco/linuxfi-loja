class Produto < ActiveRecord::Base

#  searchable do
#    text :nome, :descricao
#    float :preco
#  end
  
  #set_table_name 'produto' //setar o nome da tabela
  validates_presence_of :nome, :preco
  validates_numericality_of :preco, :great_than => 0, :allow_nil => true

  has_attached_file :imagem,
    :styles => { :medium => "300X300>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url => "/system/:class/:attachment/:id_partition/:style/:filename",
    :convert_options => { :all => '-strip' }
  
end
