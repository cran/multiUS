#' @title Compute correlations and test their statistical significance
#'
#' @description The function computes the whole correlation matrix and corresponding sample sizes and \eqn{p}-values. Print method is also available.
#' @param X Data matrix with selected variables.
#' @param method A type of correlation coefficient to be calculated, see function \code{cor}.
#' @param use In the case of missing values, which method should be used, see function \code{cor}.
#' @param \dots Arguments passed to other functions, see \code{cor.test}.
#' @examples
#' corTestDf(mtcars[, 3:5])
#' @seealso \code{cor.test}
#' @author Ales Ziberna
#' @export

corTestDf<-function(X, method = "p", use = "everything", ...){
  m<-dim(X)[2]
  varNames<-colnames(X)
  corMat<-matrix(NA,ncol=m,nrow=m)
  diag(corMat)<-1
  dimnames(corMat)<-list(varNames,varNames)
  pMat<-matrix(NA,ncol=m,nrow=m)
  diag(pMat)<-1
  dimnames(pMat)<-list(varNames,varNames)
  nMat<-matrix(NA,ncol=m,nrow=m)
  diag(nMat)<-apply(X,2,function(x)sum(!is.na(x)))
  dimnames(nMat)<-list(varNames,varNames)
  for(i in 1:(m-1)){
    for(j in (i+1):m){
      tmp<-stats::cor.test(x=X[,i],y=X[,j],...)
      corMat[i,j]<-corMat[j,i]<-tmp$estimate
      pMat[i,j]<-pMat[j,i]<-tmp$p.value
      if(tmp$method[1]=="P"){
        nMat[i,j]<-pMat[j,i]<-tmp$parameter + 2
      }else {
        nMat[i,j]<-nMat[j,i]<-sum(apply(!is.na(X[,c(i,j)]),1,prod))
      }
    }
  }
  res<-list(cor=corMat,p=pMat,n=nMat)
  class(res)<-c("corTestDf","list")
  return(res)
}
