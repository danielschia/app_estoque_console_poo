def cadastrar_produto
  mensagem('Iniciando cadastro de produto...', true, true, 1.5)
  mensagem('Digite o nome do produto:', false, false)
  nome = gets.chomp
  limpar_tela
  mensagem("Digite a descrição do produto #{verde(nome)}:", false, false)
  descricao = gets.chomp
  limpar_tela
  mensagem("Digite o preço do produto #{verde(nome)}:", false, false)
  preco = gets.to_f
  limpar_tela
  mensagem("Digite a quantidade em estoque do produto #{verde(nome)}:", false, false)
  quantidade = gets.to_i
  limpar_tela

  ProdutoServico.new(JsonRepositorio, 'db/produtos.json').adicionar(Produto.new(
      {
        'id' => Time.now.to_i,
        'nome' => nome,
        'descricao' => descricao,
        'preco' => preco,
        'quantidade' => quantidade
      }
    )
  )

  mensagem_verde("O produto #{amarelo(nome)} foi cadastrado com sucesso", false, false)
end
