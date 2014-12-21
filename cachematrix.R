## Put comments here that give an overall description of what your
## functions do

## I store the function in a variable called makeCacheMatrix, which creates
## a list to set + get the value of the matrix and to set + get the value
## of the matrix's inverse. In this case, m is the value returned from the 
## function applied to the matrix that will be cached and retrieved by the 
## next function.

makeCacheMatrix <- function(x = matrix()){
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
  }
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list (set=set, get=get,
      setmatrix=setmatrix,
      getmatrix=getmatrix)
}

## I then store the cacheSolve function in a variable called cacheSolve.
## In here, I can retrieve the prior value of m by calling getmatrix from 
## the makeCacheMatrix function. Effectively, to run this,
## I will call cacheSolve(makeCacheMatrix) after storing
## the matrix. If m isn't null, then it will return m (assigned to the 
## other environment in makeCacheMatrix).

cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data -- hold on")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}
