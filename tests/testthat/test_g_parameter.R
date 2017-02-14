config.json <- system.file('extdata', 'config.json', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')

print('Debug genetic parameter: print(is.json.file(config.json, encoding = "UTF-8", n = 7))')
print(is.json.file(config.json, encoding = "UTF-8", n = 7))
print('Debug genetic parameter: print(is.json.file(config.json, encoding = "UTF-8", n = 6)) # n is the JSON lines be readed')
print(is.json.file(config.json, encoding = "UTF-8", n = 6))

