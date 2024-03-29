#' Make factor labels
#'
#' @description The function transforms a numeric varibale into categorical one, based on the attribute data from a given SPSS file.
#' @param x Data for the selected variable, see Details.
#' @param reduce Wheter to reduce categories with zero frequency, default is \code{TRUE}.
#' @param ... Arguments passed to function \code{factor}.
#' @details
#' Data have to be imported by using the \code{foreign::read.spss} function.
#' The use of the function make sence when the parameter \code{use.value.lables} in the function \code{read.spss} is set to \code{FALSE}.
#' @return Categorical variable (vector).
#' @author Aleš Žiberna
#' @export

makeFactorLabels<-function(x, reduce=TRUE, ...){
  lab<-attr(x,"value.labels")
  if(!is.null(lab)){
    lab<-sort(lab)
    x<-factor(x,levels=lab,labels=names(lab), ...)
    if(reduce) x<-factor(x)
    return(x)
  }else{
    warning("The suplied argument does not contain the attribute \"value.labels\".\nThe unchanged argument is returned!")
    return(x)
  }
}
