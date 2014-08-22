# R Programming
# Coursera
# Program 2
# Leon Tabak
# Cornell College
# Mount Vernon, Iowa
# USA
# 22 August 2014

# create two functions: 
#  (1) makeCacheMatrix() is a constructor---it makes a matrix
#  (2) cacheSolve() computes (or retrieves a previously computed) inverse
#      of a matrix created with makeCacheMatrix()

## first, define a constructor.

# makeCacheMatrix is a function that can take a matrix
# from its caller and return to its caller a list of
# accessor ("getters") and mutator ("setters") functions.
#    The default value of the parameter is a 1x1 matrix whose single element is NA.
#    We will not check that the matrix is invertible (numeric, square, non-singular),
#    but that's what we are hoping to get!
makeCacheMatrix <- function( someMatrix = matrix()) {
  # a local variable to hold the inverse of someMatrix
  matrixInverse <- NULL
  
  # a function to change the matrix that this object contains
  set <- function( someOtherMatrix ) {
    someMatrix <<- someOtherMatrix
    # the changed matrix will (in general) have a different inverse
    matrixInverse <<- NULL
  } # set()
  
  # a function to retrieve the matrix that this object contains
  get <- function() {
    someMatrix
  } # get()
  
  # a function to change the inverse that this object contains
  setInverse <- function( ourInverse ) {
    matrixInverse <<- ourInverse
  } # setInverse()
  
  # a function to retrieve the inverse that this object contains
  getInverse <- function() {
    matrixInverse
  } # getInverse()
  
  # return a list that contains the four functions that we just defined
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse)
} # makeCacheMatrix()


# second, define a method that will return the inverse of a matrix.
#   x is the matrix whose inverse we want to compute or retrieve.
cacheSolve <- function(x, ...) {
  # result (what this function returns to its caller) will be inverse of x
  result <- x$getInverse()
  
  # if we have already computed the inverse of x and have not
  # changed x since, then just return the previously computed inverse matrix
  if( !is.null(result)) {
    message( "returning cached inverse of matrix")
    return(result)
  } # if
  
  # otherwise, we have not already computed the inverse of x and
  # so must compute it now
  data <- x$get()
  result <- solve(data, ...)
  # remember the inverse for the next time we want it!
  x$setInverse(result)
  result
} # cacheSolve()

# I wrote what now follows to help me test my solution to 
# the assigned problem---the instructions for the exercise
# did not require this additional code.

# here's some code to test our matrix class
m <- matrix(data=0,nrow=3,ncol=3)
m[1,1] = 2
m[2,2] = 4
m[3,3] = 8

a <- makeCacheMatrix(m)
# a$get() = | 2 0 0 |
#           | 0 4 0 |
#           | 0 0 8 |

aInverse <- cacheSolve(a)
# aInverse = | 1/2   0   0 | = | 0.500 0.000 0.000 |
#            |   0 1/4   0 |   | 0.000 0.250 0.000 |
#            |   0   0 1/8 |   | 0.000 0.000 0.125 |

product <- a$get() %*% aInverse
#
# %*% is R's operator for multiplication of matrices
# (in this case, * and %*% yield the same product but
# the two operators do not usually yield the same product!)
#
# a$get() %*% aInverse = | 1 0 0 |
#                        | 0 1 0 |
#                        | 0 0 1 |

