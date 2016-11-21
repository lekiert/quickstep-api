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

u1 = User.create(first_name: 'Test', last_name: 'User',
            email: 'test@email.com', password: 'secret')
u2 = User.create(first_name: 'Second', last_name: 'User',
            email: 'test2@email.com', password: 'secret2')

course = Course.create(name: 'Beginner course 1', description: 'Lorem ipsum')
course2 = Course.create(name: 'Beginner course 3', description: 'Inny tekst')

l1.courses << course
l1.courses << course2
l1.courses.create(name: 'Beginner course 2', description: 'Dolor sit amet')

l2.courses.create(name: 'Intermediate course 1', description: 'Lorem ipsum')
l2.courses.create(name: 'Intermediate course 2', description: 'Dolor sit amet')

l3.courses.create(name: 'Advanced course 1', description: 'Lorem ipsum')
l3.courses.create(name: 'Advanced course 2', description: 'Dolor sit amet')

course.users << u1
course2.users << u1

t1 = Test.create(code: 'T1_1', name: 'Test 1', description: 'Test 1 description')
t2 = Test.create(code: 'T1_2', name: 'Test 2', description: 'Test 2 description')
t3 = Test.create(code: 'T1_3', name: 'Test 3', description: 'Test 3 description')
t4 = Test.create(code: 'T1_4', name: 'Test 4', description: 'Test 4 description')

course.tests << t1
course.tests << t2

course2.tests << t2
course2.tests << t3
course2.tests << t4
