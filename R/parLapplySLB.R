parLapplySLB <-
function(cl=NULL, x, size=1, fun, ...)
{
#    requireNamespace("snow")
    fun <- match.fun(fun)
    m <- length(x)
    size <- rep(size, m)[1:m]
    id <- order(size, decreasing=TRUE)
    s <- x[id]
    id <- (1:m)[id]
    res <- clusterApplyLB(cl, s, fun, ...)
    res <- res[order(id)]
    res
}
