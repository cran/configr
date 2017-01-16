#' Merge config parameter sets by groups.
#'
#' @param file Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding Encoding of filepath parameter, will default to system encoding if not specifield 
#' @param groups Need be merged parameter sets, eg. groups=c('default', 'version'), will 
#' default to all of config groups
#' @seealso
#' \code{\link{eval.config.groups}} which only get all of the mainly parameter sets name in config file, 
#' \code{\link{read.config}} which only read from a config as a list,
#' \code{\link{eval.config}} which only read one groups as config obj or a value from config file.
#' @return a list 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' eval.config.merge(config.json)
eval.config.merge <- function(file = "config.json", groups = NULL, encoding = getOption("encoding")) {
  config.dat <- list()
  groups.all <- eval.config.groups(file = file, encoding = encoding)
  config.type <- get.config.type(file = file, encoding = encoding)
  if (is.logical(groups.all) && groups.all == FALSE) {
    return(FALSE)
  }
  if (is.null(groups)) {
    for (i in groups.all) {
      config.tmp <- eval.config(file = file, config = i)
      config.dat <- config.list.merge(config.dat, config.tmp)
    }
    attr(config.dat, "config") <- groups.all
  } else {
    groups <- groups[groups %in% groups.all]
    for (i in groups) {
      config.tmp <- eval.config(file = file, config = i)
      config.dat <- config.list.merge(config.dat, config.tmp)
      attr(config.dat, "config") <- groups
    }
  }
  attr(config.dat, "configtype") <- config.type
  attr(config.dat, "file") <- file
  return(config.dat)
}

#' Merge list file (From config package), list.right will overwrite the element also existed in list.left
#'
#' @param list.left One list be merged left
#' @param list.right One list be merged right 
#' @seealso
#' \code{\link[config]{merge}} call in this function
#' @return a list 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' list.left <- list()
#' list.right <- eval.config(file = config.json)
#' config.list.merge(list.left, list.right)
#' list.left <- list(a=c(123,456))
#' list.right <- list(a=c(4,5,6)) 
#' config.list.merge(list.left, list.right)
config.list.merge <- function(list.left = list(), list.right = list()) {
  if (!is.list(list.left) | !is.list(list.right)) {
    stop("list.left or list.left must be list type!")
  }
  config::merge(list.left, list.right)
}
