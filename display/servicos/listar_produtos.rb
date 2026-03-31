require 'terminal-table'

def listar_produtos
  mensagem_amarela('===== Lista de produtos =====', false, false)

  table = Terminal::Table.new do |t|
    t.headings = %w[ID Nome Descrição Preço Quantidade]
    ProdutoServico.new(JsonRepositorio, 'db/produtos.json').todos.each do |produto|
      t.add_row [produto.id, produto.nome, produto.descricao, produto.preco, produto.quantidade]
    end
  end

  puts table

  mensagem_amarela('Pressione Enter para voltar ao menu...', false, false)
  gets
  limpar_tela
end
