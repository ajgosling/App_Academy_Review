

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

class Game {
    constructor() {
        this.towers = [
            [3, 2, 1], [], []
        ];
    }

    run(compCB) {
        // print board between each state
        //continuously call prompt move in a while loop.
        // take input move as string (to tower/ from tower)
        // first check if valid move
        // if valid, make move. else read prompt
        // check isWon if move is valid
        this.print();
        this.promptMove();

    }
    promptMove() {
        // will print stacks, ask user where they want to move
        reader.question("Make a move [StartTower, EndTower]: ", (res) => {
            let indices = res.split(", ");
            this.move(parseInt(indices[0]), parseInt(indices[1]));
            if (this.isWon()) {
                this.print();
                compCB();
            } else {
                this.run(compCB);
            }

        });

    }

    isValidMove(sI, eI) {
        let start = this.towers[sI];
        let end = this.towers[eI];
        if (start.length == 0) {return false;}
        if (end.length == 0) {return true;}
        return start[start.length - 1] < end[end.length - 1];

    }

    move(sI, eI) {
        if (!this.isValidMove(sI, eI)) {return false;}
        this.towers[eI].push(this.towers[sI].pop());
        return true;
    }

    print() {
        console.log(JSON.stringify(this.towers));
    }

    isWon() {
        if (this.towers[0].length == 0){
            let towersWithStuff = 0;
            for (let i = 1; i < this.towers.length; i++) {
                if (this.towers[i].length > 0) {
                    towersWithStuff ++;
                }
            }
            return towersWithStuff === 1;
        }
        return false;
    }

}

g = new Game();

let compCB = function() {
    console.log("GREAT JOB KEV!!!!");
    reader.close();
};

g.run(compCB);