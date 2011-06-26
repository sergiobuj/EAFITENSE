class ServicesController < ApplicationController

  def schedule
    render :json => '[{"title":"calculo 2","credits":3,"group":2,"days":{"aula":{"dia":"martes","numero":"7-103","hora-inicio":"800","hora-final":"900"},"aula":{"dia":"jueves","numero":"18-403","hora-inicio":"1400","hora-final":"1530"}}},{"title":"Estructuras de Datos y Algoritmos","credits":4,"group":12,"days":{"aula":{"dia":"lunes","numero":"33-102","hora-inicio":"600","hora-final":"900"},"aula":{"dia":"miercoles","numero":"18-403","hora-inicio":"1400","hora-final":"1600"}}},{"title":"Seminario","credits":1,"group":1,"days":{"aula":{"dia":"viernes","numero":"19-5","hora-inicio":"1000","hora-final":"1100"}}}]'
  end

  def exams
    render :json => '[{"title":"Literatura","examinations":{"Libro 1":20,"Libro Real":20,"Parcial":20,"Final":40}},{"title":"Seminario","examinations":{"Asistencia":40,"Aportes":20,"Puntualidad":20,"Final":20}},{"title":"Musica","examinations":{"Piano":25,"Guitarra":25,"Lectura":25,"Final":25}}]'
  end

  def grades  
    render :json => '[{"title":"Literatura","grade_to_pass": 3.5, "current_grades":[["parcial 1",4.5,10],["parcial 2",3.5,10],["parcial 3",2.5,10],["parcial 4",1.5,10]]},{"title":"Musica","grade_to_pass": 3, "current_grades":[["Bachata",4.5,10],["Salsa",3.5,10],["Vallenato",2.5,10],["Tango",1.5,10]]},{"title":"EDyA","grade_to_pass": 3,"current_grades":[["Sort",4.5,10],["Search",3.1,10],["Graphs",2.5,10],["Strings",3.3,10]]},{"title":"OS","grade_to_pass": 3,"current_grades":[["kernel",4.5,10],["File System",5,10],["File System 2",4.9,10],["Drivers",3,10]]},    {"title":"Test Course","grade_to_pass": 3,"current_grades":[["one",4,20],["two",3.2,10],["three",5,5],["four",3.9,20],["five",4.2,15] ]}     ]'
  end

  def gpa
    render :json => '{"semestre pasado":4,"acumulado":4.1,"creditos cursados":130,"credutos aprobados":130,"codigo": "201110001010"}'
  end
end
