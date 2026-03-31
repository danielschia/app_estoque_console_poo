class CsvRepositorio
  require 'csv'

  def self.ler(arquivo)
    if File.exist?(arquivo)
      dados = []
      CSV.foreach(arquivo, headers: true, header_converters: :symbol) do |row|
        dados << row.to_h
      end
      dados
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
    return if array.empty?

    headers = array.first.keys

    CSV.open(arquivo, 'w', headers: headers, write_headers: true) do |csv|
      array.each do |row|
        csv << row.values_at(*headers)
      end
    end
  end
end
