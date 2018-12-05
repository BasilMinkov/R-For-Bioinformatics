# 90 degree clockwise rotation of R matrix
rotate <- function(x) t(apply(x, 2, rev))

# Plot chessboard with knight's moves.
plot_board = function(board){
  mx = matrix(rep(c(0, 1), ceiling(M*N/2)), nrow=M, ncol=N)
  image(mx)
  for (i in 1:M){
    for (j in 1:N){
      text((i-1)/10, (j-1)/10, board[i, j], cex=dig)
    }
  }
}

# Get value on a board position.
getboard = function (position) board[position[1], position[2]] 

# Set value on a board position.
setboard = function (position, x) board[position[1], position[2]] <<- x

# Knight moves.
hops = cbind(c(-2, -1), 
             c(-1, -2), 
             c(+1, -2), 
             c(+2, -1),
             c(+2, +1), 
             c(+1, +2), 
             c(-1, +2), 
             c(-2, +1))

# Validate a move.
valid = function (move) all(1 <= move & move <= c(M, N)) && (getboard(move) == 0)

# Moves possible from a given position.
explore = function (position) {
  moves = position + hops
  cbind(moves[, apply(moves, 2, valid)])
}

# Possible moves sorted according to their Wornsdorff cost.
candidates = function (position) {
  moves = explore(position)
  
  # No candidate moves available.
  if (ncol(moves) == 0) { return(moves) }
  
  wcosts = apply(moves, 2, function (position) { ncol(explore(position)) })
  cbind(moves[, order(wcosts)])
}

# Recursive function for touring the chess board.
knightTour = function (position, moveN) {
  
    # Tour Complete.
    if (moveN > (M * N)) {
      plot_board(rotate(board))
      print(board)
      quit()
    }
    
    # Available moves.
    moves = candidates(position) 
    
    # None possible. Backtrack.
    if (ncol(moves) == 0) { return() }
    
    # Make a move, and continue the tour.
    apply(moves, 2, function (position) {
      setboard(position, moveN)
      knightTour(position, moveN + 1)
      setboard(position, 0)
    })
}

########################################################

# M x N Chess Board.
M = 11
N = 11

# Starting position.
x0 = 1
y0 = 1

# Begin tour.
board = matrix(0, nrow = M, ncol = N)
position = c(x0, y0)
setboard(position, 1)
knightTour(position, 2)

