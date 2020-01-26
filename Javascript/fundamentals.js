function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping1();

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping2();

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping3();

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping4();

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}

// mysteryScoping5();

function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

// console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
    for (let i = 0; i < searchString.length; i++) {
        if (searchString.slice(i, i + subString.length) === subString) {
            return true;
        }
    }
    return false;
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(arr) {
    const changedArr = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] % 3 === 0 || arr[i] % 5 === 0) {
            if (!(arr[i] % 3 === 0 && arr[i] % 5 === 0)) {
                changedArr.push(arr[i]);
            }
        }
    }
    return changedArr;
}

// console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]));

function isPrime(num) {
    if (num <= 1) { return false; }
    let i = 2;
    while (i <= Math.pow(num, 0.5)) {
        if (num % i === 0) {
            return false;
        }
        i += 1;
    }
    return true;
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(n) {
    let sum = 0;
    let i = 2;
    while (n != 0) {
        if (isPrime(i)) {
            sum += i;
            n -= 1;
        }
        i += 1;
    }
    return sum;
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(1));
// console.log(sumOfNPrimes(4));
// console.log(sumOfNPrimes(20));

function printCallback(names) {
    names.forEach((name) => {
        console.log(name);
    });
}

// printCallback(["Mary", "Brian", "Leo"]);

function titleize(names, cb) {
    const mapped = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);

    cb(mapped);
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

// First write a constructor function for an elephant.Each elephant should have a name, height(in inches), and array of tricks in gerund form(e.g. "painting a picture" rather than "paint a picture").

// Next write a few prototype functions that will be shared among all elephants:

// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions out on them method style!