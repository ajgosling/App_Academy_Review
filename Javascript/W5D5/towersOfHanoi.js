
// function Cat(name, color) {
//     this.name = name;
//     this.color = color;
// }

// Cat.prototype.meow = function() {
//     console.log(`Hi i'm ${this.name}`);
// };

class Cat {
    constructor(name, color) {
        this.name = name;
        this.color = color;
    }

    meow() {
        console.log(`Hi i'm ${this.name}`);
    }
}

