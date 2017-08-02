#Info
- Assignment 2 - R Programming - Data science specialisastion
- **Name:** Duy Bui

###Overview
- There are two methods for creating matrix: makeRandomMatrix (create a random square matrix based on an input of row length) and makeNormalMatrix (create a square matrix based on an input list)
- The program will result in the inverse matrix

###Testing instruction
- Compile the two files "makeCacheMatrix.R" and "cacheSolve.R" by calling 
````sh
source("makeCacheMatrix.R")
source("cacheSolve.R")
````
- You now have 2 options to create a matrix. Let's start by creating a random square matrix with dimension 2
````sh
M <- makeRandomMatrix(2)
cacheSolve(M)
````
- If you want to create a square matrix by an input list
````sh
M <- makeNormalMatrix(c(1, 2, 3, 4))
cacheSolve(M)
````
