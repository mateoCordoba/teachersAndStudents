
# llamamos la libreria de sinatra
require "sinatra"

APP_ROOT = File.dirname(__FILE__)

require_relative "app/controllers/application_controller.rb"
require_relative "app/controllers/students_controller.rb"


require_relative "app/models/base.rb"
require_relative "app/models/student.rb"
require_relative "app/controllers/teachers_controller.rb"
require_relative "app/models/teacher.rb"

# CUANDO LE PASAMOS 'students' COMO PARÁMETRO A LA URL, SE ACTIVA 'StudentsController'
# EJEMPLO: http://localhost:9292/students
map ("/students"){run StudentsController}

map ("/teachers"){run TeachersController}



