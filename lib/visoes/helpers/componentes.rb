module Ondas2
	module Visoes
		module Helpers
			class Componentes < Hash
				def adiciona(objeto,nome)
					class_s = objeto.class.to_s.split('::').last
					self[class_s] ||= {}
					self[class_s][nome] = objeto
				end
		
				def o_componente_de_classe_e_nome(classe,nome)
					self[classe][nome]
				end
				alias o_de_classe_e_nome o_componente_de_classe_e_nome
			end
		end
	end
end
