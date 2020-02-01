// Array#uniq - returns a new array containing each individual element of the original array only once(creating all unique elements)

Array.prototype.uniq = function() {
    const uniqArr = [];
    this.forEach((el) => {
        if (!uniqArr.includes(el)) {
            uniqArr.push(el);
        }
    });
    return uniqArr;
};

// console.log([1, 1, 1, 2, 3, 3, "dog", "dog"].uniq());

// Array#twoSum - returns an array of position pairs where the elements sum to zero

Array.prototype.twoSum = function() {
    const pairsArr = [];
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                pairsArr.push([i, j]);
            }
        }
    }
    return pairsArr;
};

// console.log([1, 1, -1, 2, -2].twoSum());

// Array#transpose - where we have a two - dimensional array representing a matrix.returns the transpose
// should not mutate the original array

Array.prototype.transpose = function() {
    const transposedArr = [];
    for (let i = 0; i < this[0].length; i++) {
        const newRow = []; // [1, 4, 7]
        for (let j = 0; j < this.length; j++) {
            newRow.push(this[j][i]);
        }
        transposedArr.push(newRow);
    }
    return transposedArr;
};

const m1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];

// console.log(m1.transpose());