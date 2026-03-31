def iniciar_menu
  loop do
    mensagem_amarela('====== Escolha uma das opções abaixo: ======', false, false)
    mensagem_azul("#{vermelho('1')} - Cadastro de produto", false, false)
    mensagem_azul("#{vermelho('2')} - Listar produtos", false, false)
    mensagem_azul("#{vermelho('3')} - Retirar produto", false, false)
    mensagem_azul("#{vermelho('4')} - Sair", false, false)

    opcao = gets.chomp.to_i

    case opcao
    when 1
      cadastrar_produto
    when 2
      listar_produtos
    when 3
      retirar_estoque
    when 4
      mensagem 'Saindo do programa...'
      exit
    else
      mensagem 'Opção inválida. Por favor, escolha uma opção válida.'
    end
  end
end
