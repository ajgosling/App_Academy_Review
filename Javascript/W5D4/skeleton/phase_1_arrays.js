// Array#uniq - returns a new array containing each individual element of the original array only once(creating all unique elements)

// the elements should be in the order in which they first appear in the original array
// should not mutate the original array
//     ([1, 2, 2, 3, 3, 3].uniq() => [1, 2, 3])


Array.prototype.uniq = function() {
    const uniqArr = [];
    this.forEach((el) => {
        if (!uniqArr.includes(el)) {
            uniqArr.push(el);
        }
    })
    return uniqArr;
}

console.log([1, 1, 1, 2, 3, 3, "dog", "dog"].uniq());
// Array#twoSum - returns an array of position pairs where the elements sum to zero

// Array#transpose - where we have a two - dimensional array representing a matrix.returns the transpose
// should not mutate the original array