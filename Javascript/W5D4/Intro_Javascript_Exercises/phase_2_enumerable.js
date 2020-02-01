// Array#myEach(callback) - receives a callback function and executes the callback for each element in the array
// Note that JavaScript's forEach function has no return value (returns undefined)
Array.prototype.myEach = function (cb) {
    for (let i = 0; i < this.length; i++) {
        cb(this[i]);
    }
};

// [1, 2, 3, 4, 5].myEach(el => console.log(el * 6));

// Array#myMap(callback) - receives a callback function, returns a new array of the results of calling the callback function on each element of the array
// should use myEach and a closure

Array.prototype.myMap = function (cb) {
    const mapArr = [];
    this.myEach(el => {
        let mapEl = cb(el);
        mapArr.push(mapEl);
    });
    return mapArr;
};

// console.log([1, 2, 3, 4, 5].myMap( el => Math.pow(el, 3) ));


// Array#myReduce(callback[, initialValue])
// without initialValue

Array.prototype.myReduce = function (cb, initialValue = undefined) {
    if (initialValue === undefined) {
        i = 1;
        initialValue = this[0];
    } else {
        i = 0;
        // we already have initial value
    }

    let acc = initialValue;
    while (i < this.length) {
        acc = cb(acc, this[i]);
        i += 1;
    }

    return acc;
};

let t1 = [1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}); // => 6

// with initialValue
let t2 = [1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}, 25); // => 31

// console.log(t1);
// console.log(t2);