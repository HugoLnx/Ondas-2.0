module Ondas2
	module Modelos
		module InfraE
			class OndaException < Exception
				def mensagem_notificacao
					case self.message
						when :FaltaDados : 'Dados insuficientes.'
						when :SemAmplitude : 'Informe o valor da Amplitude.'
						when :ComLetras : 'Preencha os campos somente com numeros.'
						when :FrequenciaPeriodoErro : 'A frequencia deve ser o inverso do periodo.'
						when :VelocidadeLambdaFrequenciaErro : 'A velocidade deve ser igual a lambda * frequencia.'
					end
				end
			end
		end
	end
end
