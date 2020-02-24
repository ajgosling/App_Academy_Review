class Cat {
    constructor(name) {
        this.name = name;
    }

    meow() {
        console.log(`meow I am ${this.name}`);
    }
}

module.exports = Cat;