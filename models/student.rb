require_relative('../db/sql_runner.rb')

class Student

  attr_accessor  :id, :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id']
  end

#CRUD---------------------------------------------------------------------------

  def self.delete_all()
    sql = 'DELETE FROM students'
    SqlRunner.run(sql)
  end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, age, house_id) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@first_name, @last_name, @age, @house_id]
    @id = SqlRunner.run(sql, values).first['id']
  end

  def update()
    sql = 'UPDATE students SET (first_name, last_name, age, house_id) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    student_obj = SqlRunner.run(sql, values)
    new_student = Student.new(student_obj.first)
    return new_student
  end

  def self.find_all
    sql = 'SELECT * FROM students'
    student_objs = SqlRunner.run(sql)
    new_students = student_objs.map { |student| Student.new(student) }
    return new_students
  end



end
