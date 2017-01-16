#' Read from the file (JSON/INI/YAML be supported), retreiving all values as a list.
#'
#' @param file Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding Encoding of filepath parameter, will default to system encoding if not specifield.
#' @seealso
#' \code{\link[jsonlite]{fromJSON}} JSON file will read by this
#'
#' \code{\link[ini]{read.ini}} INI file will read by this
#'
#' \code{\link[yaml]{yaml.load_file}} YAML file will read by this
#' @return All values as a list.  
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' config <- read.config(file=config.json)
read.config <- function(file = "config.json", encoding = getOption("encoding")) {
  if (is.character(file) && !file.exists(file)) {
    return(FALSE)
  }
  file.type <- get.config.type(file = file, encoding = encoding)
  if (!is.character(file.type)) {
    return(FALSE)
  }
  if (file.type == "json") {
    config.dat <- jsonlite::fromJSON(paste(readLines(file, encoding = encoding), 
      collapse = ""))
  } else if (file.type == "ini") {
    config.dat <- ini::read.ini(filepath = file, encoding = encoding)
  } else if (file.type == "yaml") {
    config.dat <- yaml::yaml.load_file(input = file)
  }
  return(config.dat)
}

#' Read from the currently active configuration (JSON/INI/YAML be supported), 
#' 'retreiving either a single named value or all values as a config obj which 
#' have 'config', 'configtype', 'file' 'property.
#'
#' @param value Name of value (NULL to read all values)
#' @param config Name of configuration to read from. Defaults to the value of 
#' 'the R_CONFIG_NAME environment variable ('default' if the variable does not exist). 
#' @param file Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding Encoding of filepath parameter, will default to system encoding if not specifield 
#' @seealso
#' \code{\link{read.config}} read config by this 
#'
#' \code{\link{eval.config.merge}} which can merge multiple parameter sets by groups
#' @return Either a single value or all values as a list.  
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' config <- eval.config(file=config.json)
#' @export
eval.config <- function(value = NULL, config = Sys.getenv("R_CONFIG_ACTIVE", "default"), 
  file = "config.json", encoding = getOption("encoding")) {
  config.dat <- read.config(file, encoding = encoding)
  if (is.logical(config.dat) && config.dat == FALSE) {
    return(FALSE)
  }
  config.dat <- get.config.value(value, config, file, config.dat)
  return(config.dat)
}

#' Get config file parameter groups
#' 
#'
#' @param file Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding Encoding of filepath parameter, will default to system encoding if not specifield 
#' @seealso
#' \code{\link{eval.config.merge}} which use this get all of parameter sets groups of config file. 
#' @return a character vector including the groups infomation of configure file 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' eval.config.groups(config.json)
eval.config.groups <- function(file = "config.json", encoding = getOption("encoding")) {
  config.dat <- read.config(file, encoding)
  if (is.logical(config.dat) && config.dat == FALSE) {
    return(FALSE)
  }
  return(names(config.dat))
}
