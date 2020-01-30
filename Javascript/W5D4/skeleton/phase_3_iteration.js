// Array#bubbleSort - receives an array, returns a
// sorted array by implementing bubble sort sorting algorithm

Array.prototype.bubbleSort = function() {
    let unsorted = true;
    while (unsorted) {
        unsorted = false;
        for (let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]]
                unsorted = true;
            }
        }
    }
    return this;
};

// console.log([5, 3, 2, -4, 7, 6].bubbleSort());

String.prototype.substrings = function() {
    const substringsArr = [];

    for (let i1 = 0; i1 < this.length; i1++) {
        for (let i2 = i1 + 1; i2 <= this.length; i2++) {
            substringsArr.push(this.slice(i1, i2));
        }
    }

    return substringsArr;
};

// console.log("abc".substrings());