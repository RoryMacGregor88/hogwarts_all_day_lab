require('pry-byebug')

require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student.rb')
also_reload('./models/*')

get '/students' do #INDEX
  @students = Student.find_all()
  erb(:index)
end

get '/students/new' do  #NEW
  erb(:new)
end

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb( :create )
end

# binding.pry
# nil
