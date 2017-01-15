#' Merge config file groups
#'
#' @param file, Configuration file to read from (defaults to 'config.json') 
#' 'JSON/INI/YAML format file. 
#' @param encoding, Encoding of filepath parameter, will default to system encoding if not specifield 
#' @param groups, Set need be merged parameter sets, eg. groups=c('default', 'version') 
#' @return a list 
#' @export
#' @examples
#' config.json <- system.file('extdata', 'config.json', package='configr')
#' eval.config.merge.groups(config.json)
eval.config.merge.groups <- function(file = "config.json", groups = NULL, encoding = getOption("encoding")) {
  config.dat <- list()
  groups.all <- eval.config.groups(file = file, encoding = encoding)
  if (is.logical(groups.all) && groups.all == FALSE) {
    return(FALSE)
  }
  if (is.null(groups)) {
    for (i in groups.all) {
      config.tmp <- eval.config(file = file, config = i)
      config.dat <- config.list.merge(config.dat, config.tmp)
    }
  } else {
    groups <- groups[groups %in% groups.all]
    # stop(1)
    for (i in groups) {
      config.tmp <- eval.config(file = file, config = i)
      config.dat <- config.list.merge(config.dat, config.tmp)
    }
  }
  return(config.dat)
}

#' Merge list file (From config package), list.right will overwrite the element also existed in list.left
#'
#' @param list.left, one list be merged left
#' @param list.right, one list be merged right 
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
