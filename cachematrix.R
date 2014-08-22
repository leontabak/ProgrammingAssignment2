## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function( someMatrix = matrix()) {
  matrixInverse <- NULL
  
  set <- function( someOtherMatrix ) {
    someMatrix <<- someOtherMatrix
    matrixInverse <<- NULL
  } # set()
  
  get <- function() {
    someMatrix
  } # get()
  
  setInverse <- function( ourInverse ) {
    matrixInverse <<- ourInverse
  } # setInverse()
  
  getInverse <- function() {
    matrixInverse
  } # getInverse()
  
} # makeCacheMatrix()


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
