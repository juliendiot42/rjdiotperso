# functions to plot some statistical plot

#' plotdnorm
#'
#' @description
#' This function plot the density function of a normal distribution.
#'
#' @param mean mean
#' @param sd standard deviations
#' @param from,to x limits
#' @param by number: increment of the sequence
#' @param log logical; if TRUE, probabilities p are given as log(p)
#' (see \code{\link[stats]{dnorm}})
#' @param ... Other rguments to be passed to \code{plot_ly} (or \code{plot})
#' functions
#'
#' @author Julien Diot
#'
#' @return
#' An interactive graph if \pkg{plotly} package is available or a basic R plot.
#' @export
plotdnorm <- function(mean = 0, sd = 1,
                      from=mean-5*sd, to=mean+5*sd, by=0.01,
                      log=FALSE, ...){

    x <- seq(from, to, by)
    d <- stats::dnorm(x, mean, sd, log)

    if (requireNamespace("plotly", quietly = TRUE)) {
        p <- plotly::plot_ly(type = 'scatter',
                        mode = 'lines',
                        name = paste("N(", mean, ";", sd, ")"),
                        x = x,
                        y = d,
                        text = paste("f(X) =",round(d,3),
                                     "\nX =",round(x,3)),
                        hoverinfo = 'text',
                        ...)
    }else{
        message(paste("\"plotly\" package is not available.",
                      "\nI recommend you to install this package to",
                      "get interactive plots."))
        p <- graphics::plot(type = 'l',
                       x = x,
                       y = d,
                       xlab = "X",
                       ylab = "f(X)",
                       main = paste("N (", mean, ";", sd,")"),
                       ...)
    }

    p
}
