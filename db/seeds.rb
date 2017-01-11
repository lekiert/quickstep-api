# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

l1 = Level.create(name: 'Beginner')
l2 = Level.create(name: 'Intermediate')
l3 = Level.create(name: 'Advanced')

u1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
            email: 'student@quickstep.dev', password: 'secret', role: 'STUDENT')
u4 = User.create(first_name: 'Test', last_name: 'Admin',
            email: 'admin@quickstep.dev', password: 'secret', role: 'ADMIN')

g1 = Group.create(name: 'Pierwsza grupa', description: 'Opis pierwszej grupy')

g1.users << u1

course = Course.create(name: 'Szkoła podstawowa klasa 1', description: '-')
course2 = Course.create(name: 'Szkola podstawowa klasa 2-3', description: '-')
course3 = Course.create(name: 'Szkola podstawowa klasa 4-6', description: '-')
course4 = Course.create(name: 'Gimnazjum', description: '-')
course5 = Course.create(name: 'Liceum', description: '-')

l1.courses << course
l1.courses << course2
l1.courses << course3
l1.courses << course4
l1.courses << course5

course.users << u1
course2.users << u1
course3.users << u1
course4.users << u1
course5.users << u1

t1 = Test.create(code: 'T1_1', name: 'Test 1', description: 'Test 1 description')

course.tests << t1
