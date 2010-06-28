aqui = File.dirname __FILE__
$LOAD_PATH << File.join(aqui,'bin')

require 'java'

java_import javax.swing.BorderFactory
java_import javax.swing.Box
java_import javax.swing.BoxLayout
java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JTextField

java_import java.awt.Color
java_import java.awt.Dimension


Dir[File.join(aqui,'bin/**.class')].each do |class_arq|
	class_arq = class_arq.slice(/bin\/(.*)\.class$/,1)
	require File.basename class_arq
end