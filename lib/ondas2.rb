aqui = File.dirname __FILE__
$LOAD_PATH << aqui

require 'java'

java_import javax.swing.BorderFactory
java_import javax.swing.Box
java_import javax.swing.BoxLayout
java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JTextField

java_import java.awt.BorderLayout
java_import java.awt.Color
java_import java.awt.Container
java_import java.awt.Dimension
java_import java.awt.GridBagLayout
java_import java.awt.GridBagConstraints
java_import java.awt.geom.Line2D
java_import java.awt.event.ActionListener


java_import java.lang.Runnable
JThread = java.lang.Thread

# Dando require de todas as classes do diretorio bin
classes_requiridas = Dir[File.join(aqui,'**.class')]
classes_requiridas.delete_if{|path| path.include? 'ondas2.class'}
classes_requiridas.each do |class_arq|
	class_arq = class_arq.slice(/bin\/(.*)\.class$/,1)
	require File.basename class_arq
end