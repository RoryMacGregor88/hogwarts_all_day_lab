require_relative('../db/sql_runner.rb')

class House

  attr_accessor :name, :id, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
  end

  #CRUD---------------------------------------------------------------------------

    def self.delete_all()
      sql = 'DELETE FROM houses'
      SqlRunner.run(sql)
    end

    def save()
      sql = 'INSERT INTO houses (name, url) VALUES ($1, $2) RETURNING id'
      values = [@name, @url]
      @id = SqlRunner.run(sql, values).first['id']
    end

    def update()
      sql = 'UPDATE houses SET (name, url) = ($1, $2) WHERE id = $3'
      values = [@name, @url, @id]
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
