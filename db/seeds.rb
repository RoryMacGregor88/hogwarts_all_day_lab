require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all()
House.delete_all()

house1 = House.new({
  'name' => 'Slytherin',
  'url' => 'https://i.pinimg.com/236x/99/09/b4/9909b439320ecdd40f272e4f9c0e32bb.jpg'
})

house2 = House.new({
  'name' => 'Ravenclaw',
  'url' => 'https://i.pinimg.com/originals/f5/b9/02/f5b902b26576787e83fb48acd8169838.jpg'
})

house3 = House.new({
  'name' => 'Gryffindor',
  'url' => 'https://www.partyrama.co.uk/wp-content/uploads/2017/10/1st-gryffindor-emblem-wall-cut-out-harry-potter-wizarding-world-gallery-view-image.jpg'
})

house4 = House.new({
  'name' => 'Hufflepuff',
  'url' => 'https://cdn.shopify.com/s/files/1/0006/8213/1492/products/hufflepuff_1024x1024.jpg?v=1547683118'
})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'age' => 16,
  'house_id' => house3.id
  })

student2 = Student.new({
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'age' => 16,
  'house_id' => house3.id
  })

student3 = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'age' => 16,
  'house_id' => house3.id
  })

student4 = Student.new({
  'first_name' => 'Susan',
  'last_name' => 'Bones',
  'age' => 16,
  'house_id' => house4.id
  })

student5 = Student.new({
  'first_name' => 'Luna',
  'last_name' => 'Lovegood',
  'age' => 16,
  'house_id' => house2.id
  })

student5 = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'age' => 16,
  'house_id' => house1.id
  })

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()

# student1.first_name = 'Dobby'
# student1.update()
# p Student.find_all
