module Ondas2
	class Componentes < Hash
		def adiciona(objeto,nome)
			self[objeto.class] ||= {}
			self[objeto.class][nome] = objeto
		end
		
		def o_componente_de_classe_e_nome(classe,nome)
			self[classe][nome]
		end
		alias o_de_classe_e_nome o_componente_de_classe_e_nome
	end
end