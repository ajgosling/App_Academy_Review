// range(start, end)
// receives a start and end value, returns an array from start up to end
function range(start, end) {
    if (start >= end) {
        return [];
    } else {
        return [start].concat(range(start + 1, end));
    }
}

// console.log(range(5, 22));
// console.log(range(7, 9));
// console.log(range(8, 9));
// console.log(range(10, 9));


// sumRec(arr) - receives an array of numbers and recursively sums them

function sumRec(arr) {
    if (arr.length === 0) {
        return 0;
    } else {
        return arr[0] + sumRec(arr.slice(1));
    }
}

// console.log(sumRec([1, 2, 3, 4, 5]));
// console.log(sumRec([9, 3, 1]));
// console.log(sumRec([2]));

// exponent(base, exp) - receives a base and exponent, returns the base raise to the power of the exponent(base ^ exp)

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    } else if (exp === 1) {
        return base;
    } else if (exp % 2 === 0) {
        return (exponent(base, exp / 2)) ** 2;
    } else {
        // odd exponent
        return base * ((exponent(base, (exp - 1) / 2)) ** 2);
    }
}

// console.log(exponent(2, 4));
// console.log(exponent(3, 3));
// console.log(exponent(7, 2));

function fibonacci(n) {
    if (n <= 2) {
        return [0, 1].slice(0, n)
    } else {
        const prev = fibonacci(n - 1)
        prev.push(prev[prev.length - 2] + prev[prev.length - 1]);
        return prev;
    }
}

// console.log(fibonacci(0));
// console.log(fibonacci(1));
// console.log(fibonacci(2));
// console.log(fibonacci(3));
// console.log(fibonacci(4));
// console.log(fibonacci(20));

// deepDup(arr) - deep dup of an Array!

function deepDup(arr) {
    const dupArr = [];
    arr.forEach( el => {
        if (el instanceof Array) {
            dupArr.push(deepDup(el));
        } else {
            dupArr.push(el);
        }
    });
    return dupArr;
}

// const arr = [5, [6, 7]];
// arr2 = deepDup(arr);
// arr2[1].push(9);
// console.log(arr);
// console.log(arr2);

function bsearch(arr, target) {
    if (arr.length === 0) { return -1; }

    let midIdx = Math.floor(arr.length / 2);

    if (arr[midIdx] === target) {
        return midIdx;
    } else if (arr[midIdx] > target) {
        return bsearch(arr.slice(0, midIdx), target);
    } else {
        let result = bsearch(arr.slice(midIdx + 1), target);
        if (result === -1) {
            return -1;
        } else {
            return midIdx + 1 + result;
        }
    }
}


// console.log(bsearch([3, 4, 7, 11], 7));
// console.log(bsearch([0, 1, 2, 3, 4], 3));

function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    } else {
        let midIdx = Math.floor(arr.length / 2);
        let leftHalf = mergeSort(arr.slice(0, midIdx));
        let rightHalf = mergeSort(arr.slice(midIdx));
        return zipper(leftHalf, rightHalf)
    }
}

function zipper(arr1, arr2) {
    const merged = [];
    while (arr1.length != 0 && arr2.length != 0) {
        if (arr1[0] < arr2[0]) {
            merged.push(arr1.shift());
        } else {
            merged.push(arr2.shift());
        }
    }
    return merged.concat(arr1).concat(arr2);
}

// console.log(mergeSort([5, 7, -1, 2, 2, 0]));
// console.log(mergeSort([2, 1]));

function subsets(arr) {
    if (arr.length <= 1) {
        return [arr];
    } else {
        const prevSets = subsets(arr.slice(0, arr.length - 1));
        let newEl = arr[arr.length - 1];
        const newSets = prevSets.map( set => {
            let copy = set.slice();
            copy.push(newEl);
            return copy;
        });

        return prevSets.concat(newSets).concat([[newEl]]);
    }
}

// console.log(subsets([1, 2, 3, 4])); // [[1], [2], [1, 2]]
