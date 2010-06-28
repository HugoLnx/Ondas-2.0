aqui = File.dirname __FILE__
$LOAD_PATH << File.join(aqui,'bin')

Dir[File.join(aqui,'bin/**.class')].each do |class_arq|
	class_arq = class_arq.slice(/bin\/(.*)\.class$/,1)
	require File.basename class_arq
end