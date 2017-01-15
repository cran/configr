#' Function to check wheather file is json format 
#'
#' @param file, filename to be coerced or tested 
#' @param encoding, Encoding of filepath parameter, will default to system encoding if not specifield 
#' @return TRUE/FALSE 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' config.ini <- system.file('extdata', 'config.ini', package='configr')
#' config.yaml <- system.file('extdata', 'config.yaml', package='configr')
#' print(is.json.file(config.json))
#' print(is.json.file(config.ini))
#' print(is.json.file(config.yaml))
is.json.file <- function(file, encoding = getOption("encoding")) {
  result <- tryCatch({
    if (is.list(fromJSON(paste(readLines(file, encoding = encoding), collapse = "")))) {
      return(TRUE)
    }
  }, error = function(e) {
  })
  if (is.null(result)) {
    return(FALSE)
  }
}

#' Function to check wheather file is ini format 
#'
#' @param file, filename to be coerced or tested 
#' @param encoding, Encoding of filepath parameter, will default to system encoding if not specifield 
#' @return TRUE/FALSE 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' config.ini <- system.file('extdata', 'config.ini', package='configr')
#' config.yaml <- system.file('extdata', 'config.yaml', package='configr')
#' print(is.ini.file(config.ini))
#' print(is.ini.file(config.json))
#' print(is.ini.file(config.yaml))
is.ini.file <- function(file, encoding = getOption("encoding")) {
  ini.list <- ini::read.ini(file = file, encoding = encoding)
  if (length(ini.list) == 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#' Function to check wheather file is YAML format 
#'
#' @param file, filename to be coerced or tested 
#' @param encoding, Encoding of filepath parameter, will default to system encoding if not specifield 
#' @return TRUE/FALSE 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' config.ini <- system.file('extdata', 'config.ini', package='configr')
#' config.yaml <- system.file('extdata', 'config.yaml', package='configr')
#' print(is.yaml.file(config.yaml))
#' print(is.json.file(config.json))
#' print(is.ini.file(config.ini))
is.yaml.file <- function(file, encoding = getOption("encoding")) {
  is.json <- is.json.file(file, encoding)
  if (is.json) {
    return(FALSE)
  }
  txt <- paste(readLines(file, encoding = encoding), collapse = "\n")
  result <- tryCatch({
    if (is.list(yaml::yaml.load(txt))) {
      return(TRUE)
    }
  }, error = function(e) {
  })
  if (is.null(result)) {
    return(FALSE)
  }
}

#' Get config file type:json/ini/yaml retreiving json/ini/yaml 
#'
#' @param file, Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding, Encoding of filepath parameter, will default to system encoding if not specifield 
#' @return json/ini/yaml 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' get.config.type(file=config.json)
get.config.type <- function(file = "config.json", encoding = getOption("encoding")) {
  if (!is.character(file)) {
    return(FALSE)
  } else if (is.json.file(file = file, encoding = encoding)) {
    file.type <- "json"
  } else if (is.ini.file(file = file, encoding = encoding)) {
    file.type <- "ini"
  } else if (is.yaml.file(file = file, encoding = encoding)) {
    file.type <- "yaml"
  } else {
    return(FALSE)
  }
  return(file.type)
}
