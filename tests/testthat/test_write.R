config.json <- system.file('extdata', 'config.json', package='configr')
config.yml <- system.file('extdata', 'config.yml', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')

flog.info("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.yaml',tempdir()), write.type = 'yaml')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.yaml", tempdir())
write.config(list.test, out.fn, write.type = "yaml")

flog.info("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.ini',tempdir()), write.type = 'ini')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.ini", tempdir())
write.config(list.test, out.fn, write.type = "ini")

flog.info("Debug:write.config(list(a=c(123,b=list(456))), sprintf('%s/test.ini',tempdir()), write.type = 'json')")
list.test <- list(a=c(c=123,b=list(456)))
out.fn <- sprintf("%s/test.json", tempdir())
write.config(list.test, out.fn, write.type = "json")
