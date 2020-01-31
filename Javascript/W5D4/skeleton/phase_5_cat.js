function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}!`;
};

c1 = new Cat("fuzzball", "AJ");
c2 = new Cat("snowy", "Kevin");


Cat.prototype.cuteStatement = function() {
    return `EVERYONE loves ${this.name}!`;
};

Cat.prototype.meow = function() {
    return `${this.name} meows! MRRROWWWWW!`;
};

c1.meow = function() {
    return `GRRROWWWWWWWWWEEEEEWG`;
};

console.log(c1.meow());
console.log(c2.meow());