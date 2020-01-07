#' Generate a squence of string with prefix and suffix
#'
#' This function generate a sequence of string like: \code{prefix001, prefix002,
#' prefix003 ... prefix999}
#'
#' @param prefix prefix of the sequence
#' @param from,to the starting and (maximal) end values of the sequence
#' @param by number: increment of the sequence.
#' @param suffix suffix of the sequence
#'
#' @return character vector
#' @export
#'
#' @examples
#' charSeq(prefix = "id", from = 1, to = 10)
#' charSeq(prefix = "H-", from = 10, to = 0, by = -1, suffix = "s")
charSeq <- function(prefix = "", from, to, by = 1, suffix = "") {
    sequence <- seq(from, to, by)
    sprintf(fmt = paste0(prefix,
                         "%0", floor(log10(max(sequence))) + 1, "i",
                         suffix),
            sequence)
}
