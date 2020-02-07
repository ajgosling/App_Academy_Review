function alertCb() {
    alert('Hammertime');
}
// setTimeout(alertCb, 5000);

function hammerTime(time) {
    window.setTimeout(() => alert(`${time} is hammerTime`), time);
}

hammerTime(5000);