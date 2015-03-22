makeCacheMatrix <- function(x = matrix()) {

## x is a square invertible matrix

m<-NULL


## set the matrix
set<-function(y){
  x<<-y
  m<<-NULL
}

## get the matrix
get<-function() x

## set the inverse
setinvmatrix<-function(solve) m<<- solve

## get the inverse
getinvmatrix<-function() m

## returns a list containing the functions
list(set=set, get=get, setinvmatrix=setinvmatrix, 

getinvmatrix=getinvmatrix)
}


cacheSolve <- function(x=matrix(), ...) {

m<-x$getinvmatrix()

## if the inverse has been calculated,get it from the cache and exits
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }

## calculates the inverse
matrix<-x$get()
m<-solve(matrix, ...)

## sets the value of the inverse in the cache
x$setinvmatrix(m)


return(m)
}
