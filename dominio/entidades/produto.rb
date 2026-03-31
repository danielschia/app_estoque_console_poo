class Produto
  attr_accessor :id, :nome, :descricao, :preco, :quantidade

  def initialize(produto_hash)
    self.id = produto_hash['id'] || produto_hash[:id]
    self.nome = produto_hash['nome'] || produto_hash[:nome]
    self.descricao = produto_hash['descricao'] || produto_hash[:descricao]
    self.preco = produto_hash['preco'] || produto_hash[:preco]
    self.quantidade = produto_hash['quantidade'] || produto_hash[:quantidade]
  end
end
