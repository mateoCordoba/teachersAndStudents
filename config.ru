#Requerimos de la clase boot que contiene todas las librerias y clases necesarias
require_relative 'boot.rb'
# CUANDO LE PASAMOS 'students' COMO PARÁMETRO A LA URL, SE ACTIVA 'StudentsController'
# EJEMPLO: http://localhost:9292/students
map ("/students"){run StudentsController}
map ("/teachers"){run TeachersController}
