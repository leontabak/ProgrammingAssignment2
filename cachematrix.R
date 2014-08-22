## Put comments here that give an overall description of what your
## functions do

# Create two functions: 
#  (1) makeCacheMatrix() is a constructor---it makes a matrix
#  (2) cacheSolve() computes (or retrieves a previously computed) inverse
#      of a matrix created with makeCacheMatrix()

## Write a short comment describing this function

# makeCacheMatrix is a function that can take a matrix
# from its caller and return to its caller a list of
# accessor ("getters") and mutator ("setters") functions.
#    The default value of the parameter is a 1x1 matrix whose single element is NA.
#    We will not check that the matrix is invertible (numeric, square, non-singular),
#    but that's what we are hoping to get!
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
  
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse)
} # makeCacheMatrix()


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  result <- x$getInverse()
  
  if( !is.null(result)) {
    message( "returning cached inverse of matrix")
    return(result)
  } # if
  
  data <- x$get()
  result <- solve(data, ...)
  x$setInverse(result)
  result
} # cacheSolve()

m <- matrix(data=0,nrow=3,ncol=3)
m[1,1] = 2
m[2,2] = 4
m[3,3] = 8

a <- makeCacheMatrix(m)

aInverse <- cacheSolve(a)

product <- a$get() * aInverse

