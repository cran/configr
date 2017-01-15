# Check value wheather is NULL, and return a list or a value in list
get.config.value <- function(value = NULL, config = "", file = "", config.dat = list()) {
  if (is.null(value)) {
    config.dat <- config.dat[[config]]
    attr(config.dat, "config") <- config
    attr(config.dat, "file") <- tools::file_path_as_absolute(file)
  } else {
    config.dat <- config.dat[[config]][[value]]
  }
  return(config.dat)
}
