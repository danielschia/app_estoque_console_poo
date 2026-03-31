class JsonRepositorio
  require 'json'

  def self.ler(arquivo)
    if File.exist?(arquivo)
      file = File.read(arquivo)
      JSON.parse(file, symbolize_names: true)
    else
      "Arquivo #{arquivo} não encontrado."
    end
  end

  def self.adicionar(arquivo, obj)
    data = ler(arquivo) || []
    data << obj
    gravar(arquivo, data)
  end

  def self.gravar(arquivo, array)
    File.open(arquivo, 'w') do |file|
      file.puts JSON.pretty_generate(array)
    end
  end
end
