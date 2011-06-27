# encoding: UTF-8
class ServiceController < ApplicationController
  def schedule
    render :json => '[
        {
            "title": "Cálculo 2",
            "credits": 3,
            "group": 2,
            "start_date": "01/02/2011",
            "end_date": "20/05/2011",
            "days": [
                {
                    "day": "Lunes",
                    "number": "33-201",
                    "start_hour": "1000",
                    "end_hour": "1100"
                },
                {
                    "day": "Miércoles",
                    "number": "33-201",
                    "start_hour": "1000",
                    "end_hour": "1100"
                },
                {
                    "day": "viernes",
                    "number": "34-402",
                    "start_hour": "800",
                    "end_hour": "900"
                }
            ]
        },
        {
            "title": "Estructuras de Datos y Algoritmos",
            "credits": 4,
            "group": 12,
            "start_date": "01/02/2011",
            "end_date": "20/05/2011",
            "days": [
                {
                    "day": "Miércoles",
                    "number": "38-101",
                    "start_hour": "1000",
                    "end_hour": "1200"
                },
                {
                    "day": "viernes",
                    "number": "18-402",
                    "start_hour": "1000",
                    "end_hour": "1100"
                }
            ]
        },
        {
            "title": "Seminario",
            "credits": 1,
            "group": 1,
            "start_date": "01/02/2011",
            "end_date": "20/02/2011",
            "days": [
                {
                    "day": "Martes",
                    "number": "Fabricato",
                    "start_hour": "900",
                    "end_hour": "1200"
                }
            ]
        }
    ]'
  end

  def exams
    render :json => '[
        {
            "title": "Literatura",
            "examinations": [
                {
                    "name": "Libro 1",
                    "percentage": 25,
                    "date": "10/06/2011"
                },
                {
                    "name": "Libro 2",
                    "percentage": 25,
                    "date": "10/07/2011"
                },
                {
                    "name": "Libro 3",
                    "percentage": 25,
                    "date": "10/08/2011"
                },
                {
                    "name": "Libro 4",
                    "percentage": 25,
                    "date": "10/10/2011"
                }
            ]
        },
        {
            "title": "Seminario",
            "examinations": [
                {
                    "name": "Asistencia",
                    "percentage": 30,
                    "date": "10/10/2011"
                },
                {
                    "name": "Aportes",
                    "percentage": 30,
                    "date": "10/10/2011"
                },
                {
                    "name": "Puntualidad",
                    "percentage": 20,
                    "date": "10/10/2011"
                },
                {
                    "name": "Final",
                    "percentage": 20,
                    "date": "10/10/2011"
                }
            ]
        },
        {
            "title": "Música",
            "examinations": [
                {
                    "name": "Piano",
                    "percentage": 25,
                    "date": "10/10/2011"
                },
                {
                    "name": "Historia de la música",
                    "percentage": 15,
                    "date": "10/10/2011"
                },
                {
                    "name": "Caja Vallenata",
                    "percentage": 25,
                    "date": "10/10/2011"
                },
                {
                    "name": "Lectura",
                    "percentage": 35,
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
            "title": "Música",
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

  def gpa_student
    render :json => '{
        "last_term": 4,
        "average": 4.1,
        "total_credits": 130,
        "passed_credits": 130,
        "student_id": "201110001010"
    }'
  end
end
