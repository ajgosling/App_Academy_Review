ActiveRecord::Base.transaction do
  puts 'Beginning to seed'

  Wizard.destroy_all
  School.destroy_all
  House.destroy_all
  Course.destroy_all
  Wand.destroy_all
  CourseEnrollment.destroy_all

  # professors
  Wizard.new(
    fname: "Albus",
    lname: "Dumbledore",
  ).save!(validate: false)
  dumbledore = Wizard.last

  Wizard.new(
    fname: "Professor",
    lname: "McGonagall",
  ).save!(validate: false)
  mcgonagall = Wizard.last

  # school
  School.new(name: "Hogwarts").save!(validate: false)
  hogwarts = School.last

  dumbledore.update!(school_id: hogwarts.id)
  mcgonagall.update!(school_id: hogwarts.id)
  hogwarts.update!(headmaster_id: dumbledore.id)

  # houses
  gryffindor = House.create!(
    name: "Gryffindor",
    master_id: mcgonagall.id,
    building: "The stone one"
  )

  hufflepuff = House.create!(
    name: "Hufflepuff",
    master_id: mcgonagall.id,
    building: "The stone one"
  )

  # students
  harry = Wizard.create!(
    fname: "Harry",
    lname: "Potter",
    house_id: gryffindor.id,
    school_id: hogwarts.id
  )
  ron = Wizard.create!(
    fname: "Ron",
    lname: "Weasley",
    house_id: gryffindor.id,
    school_id: hogwarts.id
  )
  hermione = Wizard.create!(
    fname: "Hermione",
    lname: "Granger",
    house_id: gryffindor.id,
    school_id: hogwarts.id
  )

  # course
  transfiguration = Course.create!(
    instructor_id: mcgonagall.id,
    title: "Transfiguration",
    description: "Turning one thing into another thing"
  )

  # enrollments
  CourseEnrollment.create!(course_id: transfiguration.id, student_id: harry.id)
  CourseEnrollment.create!(course_id: transfiguration.id, student_id: ron.id)
  CourseEnrollment.create!(course_id: transfiguration.id, student_id: hermione.id)

  # wands
  Wand.create!(core_ingredient: "Phoenix Feather", owner_id: harry.id)
  Wand.create!(core_ingredient: "Swag", owner_id: dumbledore.id)
end
