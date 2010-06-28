aqui = File.dirname __FILE__

require File.join aqui,'../lib/ondas2'

app = Ondas2::Aplicacao.new
app.inicia