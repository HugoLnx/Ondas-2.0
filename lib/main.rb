aqui = File.dirname __FILE__

require File.join(aqui,'ondas2')

app = Ondas2::Modelos::InfraE::Aplicacao.new
app.inicia
