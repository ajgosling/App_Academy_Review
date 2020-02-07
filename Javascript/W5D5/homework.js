// function alertCb() {
//     alert('Hammertime');
// }
// // setTimeout(alertCb, 5000);

// function hammerTime(time) {
//     window.setTimeout(() => alert(`${time} is hammerTime`), time);
// }

// hammerTime(5000);

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

reader.question("would you like some tea?", (res1) => {
    console.log(res1);
    reader.question("would you like some biscuits?", (res2) => {
        console.log(`so you ${res1} want tea and you ${res2} want coffee`);
        reader.close();
    });
});

function Cat() {
    this.name = 'Markov';
    this.age = 3;
}

function Dog() {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();