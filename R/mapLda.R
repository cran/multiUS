#' LDA mapping
#'
#' @description The function draws two dimensional map of discriminant functions.
#' @param object Object obtained by \code{ldaPlus} function or \code{MASS::lda} function.
#' @param xlim Limits of the \eqn{x}-axis.
#' @param ylim Limits of the \eqn{y}-axis.
#' @param npoints Number of points on y-axis and x-axis (i.e., drawing precision).
#' @param prior Prior probabilities of class membership to estimate the model (they can be estimated based on the sample data or they can be provided by a reseacher).
#' @param dimen Number of dimensions used for prediction. Probably only 2 (as these are used for drawing) makes sense.
#' @param col Vector of mapping colors, default is \code{NULL} (i.e., it takes the default R colors).
#' @return No return value, called for side effects (plotting a map).
#' @examples
#' # Estimate the LDA model:
#' ldaCars <- ldaPlus(x = mtcars[,c(1, 3, 4, 5, 6)], grouping = mtcars[,10])
#' # Plot LDA map:
#' mapLda(ldaCars)
#' @author Aleš Žiberna
#' @export

mapLda <- function (object, xlim=c(-2,2),ylim=c(-2,2), npoints=101, prior = object$prior, dimen=2, col=NULL){
  if (!inherits(object, "lda")) stop("object not of class \"lda\"")
  ng <- length(object$prior)
  if (!missing(prior)) {
    if (any(prior < 0) || round(sum(prior), 5) != 1)
      stop("invalid 'prior'")
    if (length(prior) != ng) stop("'prior' is of incorrect length")
  }
  prop<-object$counts/sum(object$counts)
  means <- colSums(prop * object$means)
  scaling <- object$scaling
  dm <- scale(object$means, center = means, scale = FALSE) %*% scaling
  LD1<-seq(from=xlim[1],to=xlim[2],length.out = npoints)
  LD2<-seq(from=ylim[1],to=ylim[2],length.out = npoints)
  x<-cbind(rep(LD1,times=npoints),rep(LD2,each=npoints))
  dm <- dm[, 1L:dimen, drop = FALSE]
  dist <- matrix(0.5 * rowSums(dm^2) - log(prior), nrow(x),length(prior), byrow = TRUE) - x[, 1L:dimen, drop = FALSE] %*% t(dm)
  dist <- exp(-(dist - apply(dist, 1L, min, na.rm = TRUE)))
  posterior <- dist/drop(dist %*% rep(1, ng))
  nm <- names(object$prior)
  cl <- factor(nm[max.col(posterior)], levels = object$lev)
  list(class = cl, posterior = posterior, x = x)
  if(is.null(col))col<-1:ng
  graphics::image(LD1,LD2,matrix(as.numeric(cl), nrow=npoints), col=col)
}
