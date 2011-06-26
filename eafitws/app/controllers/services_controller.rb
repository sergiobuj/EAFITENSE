class ServicesController < ApplicationController

  def schedule
    render :json => '[{"title":"calculo 2","credits":3,"group":2,"days":{"aula":{"dia":"martes","numero":"7-103","hora-inicio":"800","hora-final":"900"},"aula":{"dia":"jueves","numero":"18-403","hora-inicio":"1400","hora-final":"1530"}}},{"title":"Estructuras de Datos y Algoritmos","credits":4,"group":12,"days":{"aula":{"dia":"lunes","numero":"33-102","hora-inicio":"600","hora-final":"900"},"aula":{"dia":"miercoles","numero":"18-403","hora-inicio":"1400","hora-final":"1600"}}},{"title":"Seminario","credits":1,"group":1,"days":{"aula":{"dia":"viernes","numero":"19-5","hora-inicio":"1000","hora-final":"1100"}}}]'
  end

  def exams
    render :json => '[
        {
            "title": "Literatura",
            "examinations": [
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                }
            ]
        },
        {
            "title": "Seminario",
            "examinations": [
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                }
            ]
        },
        {
            "title": "Musica",
            "examinations": [
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Libro 1",
                    "percentage": 20,
                    "date": "10/10/2011"
                }
            ]
        }
    ]'
  end

  def grades  
    render :json => '[
        {
            "title": "Literatura",
            "grade_to_pass": 3.5,
            "current_grades": [
                {
                    "exam_name": "Libro 1",
                    "exam_percentage": 20,
                    "exam_grade": 3.4
                },
                {
                    "exam_name": "final libro",
                    "exam_percentage": 30,
                    "exam_grade": 3.7
                }
            ]
        },
        {
            "title": "Musica",
            "grade_to_pass": 3,
            "current_grades": [
                {
                    "exam_name": "bachata 1",
                    "exam_percentage": 20,
                    "exam_grade": 5
                },
                {
                    "exam_name": "salsa ",
                    "exam_percentage": 30,
                    "exam_grade": 4.7
                }
            ]
        },
        {
            "title": "EDyA",
            "grade_to_pass": 3,
            "current_grades": [
                {
                    "exam_name": "tema 1",
                    "exam_percentage": 20,
                    "exam_grade": 4.4
                },
                {
                    "exam_name": "final",
                    "exam_percentage": 30,
                    "exam_grade": 2.7
                }
            ]
        },
        {
            "title": "OS",
            "grade_to_pass": 3,
            "current_grades": [
                {
                    "exam_name": "FS 1",
                    "exam_percentage": 20,
                    "exam_grade": 4.4
                },
                {
                    "exam_name": "parcial",
                    "exam_percentage": 30,
                    "exam_grade": 5
                }
            ]
        },
        {
            "title": "Test Course",
            "grade_to_pass": 3,
            "current_grades": [
                {
                    "exam_name": "test 1",
                    "exam_percentage": 20,
                    "exam_grade": 3
                },
                {
                    "exam_name": "test final libro",
                    "exam_percentage": 30,
                    "exam_grade": 3.2
                }
            ]
        }
    ]'
  end

  def gpa
    render :json => '{"semestre pasado":4,"acumulado":4.1,"creditos cursados":130,"credutos aprobados":130,"codigo": "201110001010"}'
  end
end
