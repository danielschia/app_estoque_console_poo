require 'terminal-table'

def retirar_estoque
  mensagem_amarela('===== Escolha um dos produtos abaixo =====', false, false)

  table = Terminal::Table.new do |t|
    t.headings = %w[ID Nome Quantidade]
    ProdutoServico.new(JsonRepositorio, 'db/produtos.json').todos.each do |produto|
      t.add_row [produto.id, produto.nome, produto.quantidade]
    end
  end

  puts table

  mensagem_azul('Digite o ID do produto: ', false, false)
  id = gets.to_i

  produto = ProdutoServico.new(JsonRepositorio, 'db/produtos.json').todos.find { |p| p.id == id }
  unless produto
    mensagem_vermelha("Produto do ID (#{id}) não encontrado\n", false, false)
    mensagem_amarela('Deseja digitar o número novamente? (S/N)', false, false)
    resposta = gets.chomp.upcase
    return unless resposta == 'S'

    limpar_tela
    retirar_estoque
  end

  limpar_tela
  mensagem_amarela("Quantidade atual #{amarelo(produto.quantidade)}", false, false)
  mensagem_azul("Digite a quantidade a ser retirada do produto #{verde(produto.nome)}: ", false, false)
  quantidade_retirada = gets.to_i
  produto.quantidade -= quantidade_retirada

  ProdutoServico.new(JsonRepositorio, 'db/produtos.json').atualizar(produto)
  mensagem_verde('Retirada realizada com sucesso!')
  listar_produtos
end
