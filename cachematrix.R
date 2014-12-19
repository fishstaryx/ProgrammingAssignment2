##The aim of these functions is to cache the inverse matirx.

## to build a special matrix object for the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    rm <- NULL
    set <- function(y) {
        x <<- y
	rm <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) rm <<- solve
    getsolve <- function() rm
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}


## to calculate the inverse matrix

cacheSolve <- function(x, ...) {
    rm <- x$getsolve()
    if (!is.null(rm)) {
        message("getting cached data")
	return(rm)
    }
    data <- x$get()
    rm <- solve(data, ...)
    x$setsolve(rm)
    rm
}
