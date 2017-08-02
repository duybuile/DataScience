#This function computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then cacheSolve should retrieve 
#the inverse from the cache.

cacheSolve <- function(M,...){
  
  #The random matrix is created using function createMatrix
  origin <- M$createMatrix()
  
  #The inverse of the matrix is retrieved
  inverse <- M$retrieveInverse()
  
  #return both matrices for better visual convenience 
  list (origin, inverse)
}