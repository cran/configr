config.json <- system.file('extdata', 'config.json', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')

print(sprintf("Debug:%s config file type:%s", config.json, get.config.type(config.json)))
print(sprintf("Debug:%s config file type:%s", config.ini, get.config.type(config.ini)))
print(sprintf("Debug:%s config file type:%s", config.yaml, get.config.type(config.yaml)))
print(sprintf("Debug:%s config file type:%s", config.toml, get.config.type(config.toml)))

#Test is.json.file
print("Debug:is.json.file(config.json)")
print(is.json.file(config.json))
print("Debug:is.json.file(config.yaml)")
print(is.json.file(config.yaml))
print("Debug:is.json.file(config.ini)")
print(is.json.file(config.ini))
print("Debug:is.json.file(config.toml)")
print(is.json.file(config.toml))

#Test is.ini.file
print("Debug:is.ini.file(config.json)")
print(is.ini.file(config.json))
print("Debug:is.ini.file(config.yaml)")
print(is.ini.file(config.yaml))
print("Debug:is.ini.file(config.ini)")
print(is.ini.file(config.ini))
print("Debug:is.ini.file(config.toml)")
print(is.ini.file(config.toml))

#Test is.yaml.file
print("Debug:is.yaml.file(config.json)")
print(is.yaml.file(config.json))
print("Debug:is.yaml.file(config.yaml)")
print(is.yaml.file(config.yaml))
print("Debug:is.yaml.file(config.ini)")
print(is.yaml.file(config.ini))
print("Debug:is.yaml.file(config.toml)")
print(is.yaml.file(config.toml))

#Test is.toml.file
print("Debug:is.toml.file(config.json)")
print(is.toml.file(config.json))
print("Debug:is.toml.file(config.yaml)")
print(is.toml.file(config.yaml))
print("Debug:is.toml.file(config.ini)")
print(is.toml.file(config.ini))
print("Debug:is.toml.file(config.toml)")
print(is.toml.file(config.toml))
