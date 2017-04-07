1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
If the inverse has already been calculated (and the matrix has not changed), 
then the cachesolve should retrieve the inverse from the cache.
Computing the inverse of a square matrix can be done with the solve function in R. 
For example, if X is a square invertible matrix, then solve(X) returns its inverse

My answer:
##FIRSTLY, to create a matrix
##a is a matrix
makeCacheMatrix <- function(x = matrix()) {
a <- NULL
set <- function(y) {
x <<- y
a <<- NULL
}
get <- function() x
setInverse <- function(inverse) a <<- inverse
getInverse <- function() a
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
##SECONDLY, to check if we can inverse this matrix and inverse it or the inversed matrix has alreay existed then just use it
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
a <- x$getInverse()
if (!is.null(a)) {
message("getting cached data")
return(a)
}
mat <- x$get()
a <- solve(mat, ...)
x$setInverse(a)
a
}
