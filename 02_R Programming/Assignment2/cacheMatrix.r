# Creates a list containing:
#
# a) function setting value of matrix (m)
# b) function getting value of matrix 
# c) function inverting (by solve() function) the matrix, putting result in inv
# d) function getting inverted matrix (inv)
#
# Let us assume that we can  always invert the given matrix 
#
makeCacheMatrix <- function(m = matrix()) {
        
        #set to NULL inverted matrix
        inv <- NULL
        
        # set the value of the matrix
        set <- function(y) {
                    m <<- y
                    inv <<- NULL
        }
        
        # get the value of the matrix
        get <- function() { 
                    m
        }  

        # set the value of the inverted
        setsolve <- function(solve){
                   inv <<- solve                
        }         
         
        # get the value of the inverted
        getsolve <- function() {
                    inv
        }
        
        # here we set the return variables
        list(set = set, 
             get = get,
             setsolve = setsolve,
             getsolve = getsolve)
              
}

# Returns an inverted matrix
# If the matrix is already cached, then returns that value, 
# else calculate now the value
cacheSolve <- function(x, ...) {
        
        # checking if matrix was already cached...
        inv <- x$getsolve()

        # it was cached
        if(!is.null(inv)) {
                message("getting inverted matrix from cached data")
                return(inv)
        }
        
        # it was not cached
        mat <-x$get()
        
        #  now we invert it
        inv <- solve(mat)
        
        # putting in the cache the calculated value 
        x$setsolve(inv)
        
        inv
}