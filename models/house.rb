require_relative('../db/sql_runner.rb')

class House

  def inititlize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  #CRUD---------------------------------------------------------------------------

    def self.delete_all()
      sql = 'DELETE FROM houses'
      SqlRunner.run(sql)
    end

    def save()
      sql = 'INSERT INTO houses (name) VALUES ($1) RETURNING id'
      values = [@name]
      @id = SqlRunner.run(sql, values).first['id']
    end

    def update()
      sql = 'UPDATE houses SET (name) = ($1) WHERE id = $2'
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = 'SELECT * FROM houses WHERE id = $1'
      values = [id]
      house_obj = SqlRunner.run(sql, values)
      new_house = House.new(house_obj.first)
      return new_house
    end

    def self.find_all
      sql = 'SELECT * FROM houses'
      house_objs = SqlRunner.run(sql)
      new_house = house_objs.map { |house| House.new(house) }
      return new_house
    end


end
