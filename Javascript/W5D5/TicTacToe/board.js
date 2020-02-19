
class Board {
    constructor() {
        this.grid = [
            ["X", "O", "O"],
            ["X", "O", null],
            ["O", "X", null]
        ];
        this.winningPositions = [
            // horizontal
            [[0, 0], [0, 1], [0, 2]],
            [[1, 0], [1, 1], [1, 2]],
            [[2, 0], [2, 1], [2, 2]],
            // vertical
            [[0, 0], [1, 0], [2, 0]],
            [[0, 1], [1, 1], [2, 1]],
            [[0, 2], [1, 2], [2, 2]],
            // diagonal
            [[0, 0], [1, 1], [2, 2]],
            [[0, 2], [1, 1], [2, 0]]
        ];
    }

    won() {
        // iterate through winning positions
        for (let i = 0; i < this.winningPositions.length; i++) {
            let posArr = this.winningPositions[i];
            let firstPos = posArr[0];

            let firstItem = this.value(firstPos);

            if (firstItem) {
                if (posArr.every(el => el === firstItem)) {
                    return true;
                }
            }
        }
        return false;
    }

    winner() {
    }

    empty(pos) {
        return this.value(pos) === null;
    }

    value(pos) {
        return this.grid[pos[0]][pos[1]];
    }

    place_mark(pos, mark) {
    }
}

let b = new Board();
// console.log(b.value([2, 0]));
// console.log(b.value([1, 1]));
// console.log(b.value([0, 2]));

console.log(b.won());
// console.log(b.value([0, 0]));





module.exports = Board;