Dado /^que o usuario iniciou o programa$/ do
  Ondas2::Aplicacao.inicia
end

Entao /^(|ele )deve vizualizar [oa] "([^\"]*)" "([^\"]*)"$/ do |none, tipo_comp, nome_comp|
  tipo_comp.para_sym!
  comp = Ondas2::Aplicacao.componentes.o_de_tipo_e_nome tipo_comp, nome_comp
  comp.should be_visible
end