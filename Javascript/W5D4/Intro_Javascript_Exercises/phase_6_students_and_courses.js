function Student(fName, lName) {
    this.fName = fName;
    this.lName = lName;
    this.courses = [];
}

Student.prototype.name = function() {
    return `${this.fName} ${this.lName}`;
};


Student.prototype.enroll = function(course) {
    if (!course.students.includes(this)) {
        this.courses.push(course);
        course.students.push(this);
    }
};

Student.prototype.courseLoad = function() {
    const depCredits = {};
    this.courses.forEach( course => {
        if (depCredits[course.dep]) {
            depCredits[course.dep] += course.credits;
        } else {
            depCredits[course.dep] = course.credits;
        }
    });

    return depCredits;
};




function Course(name, dep, credits) {
    this.name = name;
    this.dep = dep;
    this.credits = credits;
    this.students = [];
}

Course.prototype.addStudent = function(student) {
    student.enroll(this);
};