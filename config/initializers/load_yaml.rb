module LoadYaml
  EMPIRE_INFO = YAML.load_file("#{Rails.root}/lib/yaml/empires.yml")
end