require_relative('../models/student.rb')

Student.delete_all()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => 'Gryffindor',
  'age' => 16,
  })

student2 = Student.new({
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house' => 'Gryffindor',
  'age' => 16,
  })

student3 = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'house' => 'Gryffindor',
  'age' => 16,
  })

student4 = Student.new({
  'first_name' => 'Susan',
  'last_name' => 'Bones',
  'house' => 'Hufflepuff',
  'age' => 16,
  })

student5 = Student.new({
  'first_name' => 'Luna',
  'last_name' => 'Lovegood',
  'house' => 'Ravenclaw',
  'age' => 16,
  })

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()

# student1.first_name = 'Dobby'
# student1.update()

# p Student.find_all
