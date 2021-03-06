% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/configtype.R
\name{is.toml.file}
\alias{is.toml.file}
\title{Function to check wheather file is TOML format}
\usage{
is.toml.file(
  file = Sys.getenv("R_CONFIGFILE_ACTIVE", "config.cfg"),
  toml.file.debug = FALSE,
  ...
)
}
\arguments{
\item{file}{File name of configuration file to test. Defaults to the value of
the 'R_CONFIGFILE_ACTIVE' environment variable ('config.cfg' if the
variable does not exist and JSON/INI/YAML/TOML format only)}

\item{toml.file.debug}{If TRUE, it will show error infomation when read TOML config,
default is FALSE}

\item{...}{Arguments for \code{\link[RcppTOML]{parseTOML}}}
}
\value{
Logical indicating whether the specified configuration file is TOML format
}
\description{
Function to check wheather file is TOML format
}
\examples{
config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
print(is.toml.file(config.json))
print(is.toml.file(config.ini))
print(is.toml.file(config.yaml))
print(is.toml.file(config.toml))
}
\seealso{
\code{\link{is.json.file}}
\code{\link{is.ini.file}},
\code{\link{is.yaml.file}}
}
