#' Find all R packages to install
#'
#' This function will check all ".R" file in a given repository and find all
#' refferences to loaded packages through \code{library(pkg)} or
#' \code{require(pkg)}. The function will show a R line to install these
#' packages: \code{install.packages(c("pkg1", "pkg2", ...)}
#'
#' NOTE : This work for packages hosted on CRAN, not on Bioconductor. More
#' generally it do not work for package than can't be installed by :
#' \code{install.packages("pkg")} do not work
#'
#' @param path path of the R project (current working directory by default)
#' @param file (optional) file name of the output file
#' @param quote (optional) quote type, either " or '  (default: " )
#'
#' @return NULL
#' @import stringr
#' @export
#'
#' @examples
#' packages2Install()
packages2Install <- function(path = getwd(), file = NA, quote = "\"") {

  stopifnot(dir.exists(path),
            quote %in% c("\"", "'"))

  # extract all R files
  rFiles <- list.files(path = path,
                       recursive = T,
                       pattern = ".*\\.R$", # all files ending by ".R"
                       full.names = TRUE)

  if (length(rFiles) == 0) {
    stop(paste0("No \".R\" files found in ", path))
  }

  # extract loaded packages
  allPkgs <- unlist(sapply(rFiles, .findPackages, USE.NAMES = FALSE))
  allPkgs <- unique(allPkgs)
  allPkgs <- stringr::str_sort(allPkgs)
  allPkgs <- paste0(allPkgs, collapse = paste0(quote, ", ", quote))

  # create the install commande
  installCmd <- paste0("install.packages(c(", quote, allPkgs, quote, "))")
  # work only for packges on cran !!!!

  # display the install commande
  cat(installCmd);cat("\n")


  # write the install command in a file
  if (!is.na(file)) {
    if (Sys.info()["sysname"] == "Windows") {
      sep <- "/"
    } else sep <- "\\"

    header <- "# File automatically created using the rjdiotperso's 'packageToInstall' function. see https://github.com/juliendiot42/rjdiotperso\n\n"
    content <- paste0(header, installCmd)
    filePath <- paste0(path,sep, file)
    writeLines(content, filePath)
    cat(paste0("File created !\nsee: ", filePath))
  }
}

#' Exctract the packages loaded in a R file
#'
#' @param file R file
#'
#' @import stringr
#'
#' @return character vector
#'
.findPackages <- function(file){

  code <- readChar(file, file.info(file)$size)

  pattern <- "(?<=((library)|(require))\\([\\\"\\']?)[a-zA-Z0-9]*(?=[\\\"\\']?\\))"
  # "(?<=....)" is lookbehind ....
  # "(?=....)" is lookahead ....

  # TODO manage the cases when packages are called by "package::function()"

  pkgs <- unlist(stringr::str_extract_all(code, pattern))

  pkgs
}
