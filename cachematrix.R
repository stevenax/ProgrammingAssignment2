## These functions create matrices that can cache and retrieve
## their inverses if they have already been calculated.

## This function creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
     
     m <- NULL
     set <- function(y) {
          x <<- y
          m <<- NULL
     }
     get <- function() x
     setinv <- function(inv) m <<- inv
     getinv <- function() m
     list(set = set, get = get,
          setinv = setinv,
          getinv = getinv)
     
}


## This function computes the inverse of the matrix returned by
## makeCacheMatrix or returns the cached inverse if it has already
## been calculated.

cacheSolve <- function(x, ...) {
     
     m <- x$getinv()
     if(!is.null(m)) {
          message("getting cached data")
          return(m)
     }
     data <- x$get()
     m <- solve(data, ...)
     x$setinv(m)
     m
     
}
