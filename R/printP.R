#' Print p-value
#'
#' @description The function round and prints \eqn{p}-value.
#' @param p Value to be printed.
#' @examples
#' printP(p = 0.523)
#' printP(p = 0.022)
#' printP(p = 0.099)
#' @return A string (formatted \eqn{p}-value).
#' @author Marjan Cugmas
#' @export

printP <- function(p){
  if ((p<=1) & (p>=0)) {
    if (p<0.01) return("p < 0.01")
    if (p==0.01) return("p = 0.01")
    if (p<0.05 & p>0.01) return("p < 0.05")
    if (p==0.05) return("p = 0.05")
    if (p<0.10 & p>0.05) return("p < 0.10")
    if (p==0.10) return("p = 0.10")
    else return(paste("p = ", round(p, 2)))
  } else (return(warning("P value have to be between 0 and 1.")))
}
