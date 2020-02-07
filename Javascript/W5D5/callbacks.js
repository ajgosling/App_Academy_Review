class Clock {
    constructor() {
        // 1. Create a Date object.
        let newDate = new Date;

        // 2. Store the hours, minutes, and seconds.
        this.hours = newDate.getHours();
        this.minutes = newDate.getMinutes();
        this.seconds = newDate.getSeconds();

        // 3. Call printTime.
        this.printTime();

        // 4. Schedule the tick at 1 second intervals.
        setInterval(() => this._tick.call(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        let hoursString = this.hours < 10 ? `0${this.hours}` : this.hours.toString();
        let minutesString = this.minutes < 10 ? `0${this.minutes}` : this.minutes.toString();
        let secondsString = this.seconds < 10 ? `0${this.seconds}` : this.seconds.toString();

        console.log(`${hoursString}:${minutesString}:${secondsString}`);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        this.seconds += 1;
        if (this.seconds >= 60) {
            this.minutes += 1;
            this.seconds = 0;
        }
        if (this.minutes >= 60) {
            this.hours += 1;
            this.minutes = 0;
        }
        if (this.hours >= 12) {
            this.hours = 0;
        }
        this.printTime();

    }
}

// const clock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question("give num: ", (res) => {
            sum += parseInt(res);
            console.log(`sum is ${sum}`);
            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } else {
        completionCallback(sum);
    }
}

// addNumbers(0, 3, sum => {
//     console.log(`Total Sum: ${sum}`);
//     reader.close();
// });

function absurdBubbleSort(arr, sortCompletionCallback) {

}

function askIfGreaterThan(el1, el2, cb) {
    reader.question(`is ${el1} greater than ${el2}? y/n: `, res => {
        if (res === 'y' || res === 'yes') {
            cb(true);
        } else {
            cb(false);
        }
    });
    reader.close();
}
