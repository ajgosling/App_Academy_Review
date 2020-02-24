class Dog {
    constructor(name) {
        this.name = name;
    }

    woof() {
        console.log(`woof, I am ${this.name}`);
    }
}

module.exports = Dog;