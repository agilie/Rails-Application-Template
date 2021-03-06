require 'yaml'

TEMPLATE_PATH = File.expand_path File.dirname(__FILE__).freeze
apply "#{TEMPLATE_PATH}/utils.rb"

$runners = YAML.load_file("#{TEMPLATE_PATH}/config.yml")

$runners.each do |name, value|
  puts "====== Runing block #{name} ======"
  template = "#{TEMPLATE_PATH}/runners/#{name}.rb"
  apply template if File.file?(template)

  set_gems_from_runner name
end