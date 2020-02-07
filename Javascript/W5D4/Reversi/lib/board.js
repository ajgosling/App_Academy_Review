let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for(let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if there are any valid moves for the given color.
 */

Board.prototype.posDirArr = function (pos, dir) {
  const dirArr = [];
  let tempPos = pos;

  while (tempPos[0] < 7 && tempPos[0] >= 0 && tempPos[1] < 7 && tempPos[1] >= 0) {
    tempPos = tempPos.slice();
    tempPos[0] += dir[0];
    tempPos[1] += dir[1];
    dirArr.push(tempPos);
  }
  return dirArr;
};

Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0;
};


/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  return this.getPiece(pos) ? this.getPiece(pos).color === color : false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !(this.hasMove("white") && this.hasMove("black"));
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] <= 7) && (pos[1] >= 0 && pos[1] <= 7);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  // if (this.validMove())
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (!this.getPiece(pos)) {
    for (let dir = 0; dir < Board.DIRS.length; dir++) {
      const newPos = [];
      let currDir = Board.DIRS[dir];
      newPos[0] = pos[0] + currDir[0];
      newPos[1] = pos[1] + currDir[1];
      if (newPos[0] < 8 && newPos[0] > 0 && newPos[1] < 8 && newPos[1] > 0) {
        if (this.getPiece(newPos) && this.getPiece(newPos).color !== color) {
          // get possible positions
          dirArr = this.posDirArr(newPos, Board.DIRS[dir]);
          for (let i = 0; i < dirArr.length; i++) {
            if (!this.getPiece(dirArr[i])) {
              break;
            } else if (this.getPiece(dirArr[i]).color === color) {
              return true;
            }
          }
        }
      }
    }
  }
  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const validMovesArr = [];
  for (let row = 0; row < this.grid.length; row++) {
    for (let col = 0; col < this.grid[row].length; col++) {
      let pos = [row, col];
      if (this.validMove(pos, color)) {
        validMovesArr.push(pos);
      }
    }
  }
  return this.validMovesArr;
};

// b1 = new Board;
// console.log(b1);
// console.log(b1.hasMove('black'));
module.exports = Board;
