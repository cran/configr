config.json <- system.file('extdata', 'config.json', package='configr')
config.yml <- system.file('extdata', 'config.yml', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')

#Test is.json.file
flog.info("Debug:is.json.file(config.json)")
print(is.json.file(config.json))
flog.info("Debug:is.json.file(config.yml)")
print(is.json.file(config.yml))
flog.info("Debug:is.json.file(config.ini)")
print(is.json.file(config.ini))

#Test is.ini.file
flog.info("Debug:is.ini.file(config.json)")
print(is.ini.file(config.json))
flog.info("Debug:is.ini.file(config.yml)")
print(is.ini.file(config.yml))
flog.info("Debug:is.ini.file(config.ini)")
print(is.ini.file(config.ini))

#Test is.yaml.file
flog.info("Debug:is.yaml.file(config.json)")
print(is.yaml.file(config.json))
flog.info("Debug:is.yaml.file(config.yml)")
print(is.yaml.file(config.yml))
flog.info("Debug:is.yaml.file(config.ini)")
print(is.yaml.file(config.ini))
