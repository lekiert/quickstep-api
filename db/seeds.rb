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

course = Course.create(name: 'Beginner test 1', description: 'Lorem ipsum')

l1.courses << course
l1.courses.create(name: 'Beginner test 2', description: 'Dolor sit amet')

l2.courses.create(name: 'Intermediate test 1', description: 'Lorem ipsum')
l2.courses.create(name: 'Intermediate test 2', description: 'Dolor sit amet')

l3.courses.create(name: 'Advanced test 1', description: 'Lorem ipsum')
l3.courses.create(name: 'Advanced test 2', description: 'Dolor sit amet')

course.users << u1
