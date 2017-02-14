config.json <- system.file('extdata', 'config.json', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')

print("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.yaml',tempdir()), write.type = 'yaml')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.yaml", tempdir())
print(write.config(list.test, out.fn, write.type = "yaml"))

print("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.ini',tempdir()), write.type = 'ini')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.ini", tempdir())
print(write.config(list.test, out.fn, write.type = "ini"))

print("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.json',tempdir()), write.type = 'json')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.json", tempdir())
print(write.config(list.test, out.fn, write.type = "json"))

print("Debug:write.config(NULL, sprintf('%s/test.yaml',tempdir()), write.type = 'yaml')")
out.fn <- sprintf("%s/test.yaml", tempdir())
print(suppressWarnings(write.config(NULL, out.fn, write.type = "yaml")))
