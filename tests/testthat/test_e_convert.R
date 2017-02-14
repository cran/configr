config.json <- system.file('extdata', 'config.json', package='configr')
out.file <- sprintf("%s/config.ini", tempdir()) 
print(sprintf("Debug:convert.config(file = '%s', out.file = '%s').", config.json, out.file))
print(convert.config(file=config.json, out.file = out.file))
