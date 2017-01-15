configr package
==============

The R package '[configr](https://github.com/Miachol/configr)' implements the
[YAML](https://CRAN.R-project.org/package=yaml) parser, 
[JSON](https://CRAN.R-project.org/package=rjson) parser and 
[INI](https://CRAN.R-project.org/package=ini) parser for 
R setting and writing of configuration file.

# Introduction 

configr can be used to parse and generate JSON/YAML/INI format configuration file. 
The functionality of this package is similar to that of package '[config](https://CRAN.R-project.org/package=config)'.  

## Configuration file format

### JSON

	{   "default":{
	        "debug":true
	    },
	    "comments":{
	        "version":"0.0.1"
	    }
	}


### YAML

	default:
	  debug: true
	comments:
	  version: 0.0.1

### INI

	[default]
	debug=TRUE
	[comments]
	version=0.0.1


# Installation

## CRAN

You can install this package directly from CRAN by running (from within R):
`install.packages('configr')`

## Zip/Tarball

1. Download the appropriate zip file or tar.gz file from Github
2. Unzip the file and change directories into the configr directory
3. Run `R CMD INSTALL pkg`

# Usage


    #Read in R as a list (json/yaml/ini be suported)
    config.json <- system.file('extdata', 'config.json', package='configr')
    config.yml <- system.file('extdata', 'config.yml', package='configr')
	config.ini <- system.file('extdata', 'config.ini', package='configr')

    #Test file type of config file
    is.json <- is.json.file(config.json)
    is.yml <- is.yaml.file(config.yml)
    is.ini <- is.ini.file(config.ini)

    #Get config file type (json/yaml/ini)
    json <- get.config.type(config.json) 
    yml <- get.config.type(config.yml) 
    ini <- get.config.type(config.ini) 

	json.list <- read.config(config.json)
	yml.list <- read.config(config.yml)
	ini.list <- read.config(config.ini)
	
	#Get the same obj with config package, only get the 'default or R_CONFIG_ACTIVE config sets'
	config.json.obj <- eval.config(file = config.json)
	config.yml.obj <- eval.config(file = config.yml)
	config.ini.obj <- eval.config(file = config.ini)
	
	#Get the all first level of groups in configuration files
	json.groups <- eval.config.groups(file = config.json)
	yml.groups <- eval.config.groups(file = config.yml)
	ini.groups <- eval.config.groups(file = config.ini)
	
	#Get mulitple config sets
	json.config.all <- eval.config.merge.groups(file = config.json)
	yml.config.all <- eval.config.merge.groups(file = config.yml)
	ini.config.all <- eval.config.merge.groups(file = config.ini)
	
	#Merge to list
	list.left <- list(a=c(123,456))
	list.right <- list(a=c(4,5,6))
	config.list.merge(list.left, list.right)
	
	#Write config in file 
	list.test <- list(a=c(123,456))
	write.config(list.test, "/tmp/test.json", write.type = "json")
	write.config(list.test, "/tmp/test.yaml", write.type = "yaml")
	write.config(list.test, "/tmp/test.ini", write.type = "ini")
