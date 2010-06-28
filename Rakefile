=begin
	Sobre mim...
	Nome: Hugo Roque(a.k.a HugoLnx)
	Email: hugo.roque@caelum.com.br
	Twitter: http://www.twitter.com/hugolnx
=end

DIR_RB = 'lib'
DIR_CLASS = 'bin/classes'

task :compilar do
	aqui = File.dirname __FILE__
	
	dirs = Dir[File.join(aqui,"lib/**/")].sort
	scripts_na_lib_lib = (Dir[File.join(aqui,"#{DIR_RB}/**.rb")]).sort
	scripts_na_lib = Dir[File.join(aqui,'lib/*.rb')].sort
	
	puts '=> Criando diretorios para os arquivos compilados...'
	dirs.each do |dir|
		new_dir = dir.sub DIR_RB,DIR_CLASS
		unless File.exist? new_dir
			puts " Criando diretório #{new_dir}"
			Dir.mkdir new_dir
		end
	end
	
	puts '=> Compilando scripts ...'
	threads = []
	dir = File.join aqui, DIR_RB
	scripts_na_lib_lib.each do |script|
			sh "jruby -S jrubyc \"#{script}\" -d \"#{dir}\" -t \"#{DIR_CLASS}/\""
	end
end