class ServicesController < ApplicationController
  
  def schedule
      render :json => '
      {
        "schedule": {
            "class": {
                "title":       "calculo 2", 
                "credits":      3, 
                "days": {
                    "aula": {
                      "dia" : "martes",
                      "numero": "7-103",
                      "hora-inicio": "800",
                      "hora-final" : "900"
                    },
                    "aula": {
                      "dia" : "jueves",
                      "numero": "18-403",
                      "hora-inicio": "1400",
                      "hora-final" : "1530"
                    }
                }
            },

             "class": {
                  "title":       "Estructuras de Datos y Algoritmos", 
                  "credits":      4, 
                  "days": {
                      "aula": {
                        "dia" : "lunes",
                        "numero": "33-102",
                        "hora-inicio": "600",
                        "hora-final" : "900"
                      },
                      "aula": {
                        "dia" : "miercoles",
                        "numero": "18-403",
                        "hora-inicio": "1400",
                        "hora-final" : "1600"
                      }
                  }
              },
              
               "class": {
                    "title":       "Seminario", 
                    "credits":      1, 
                    "days": {
                        "aula": {
                          "dia" : "viernes",
                          "numero": "19-5",
                          "hora-inicio": "1000",
                          "hora-final" : "1100"
                        }
                    }
                }
        }
      }
        '
  end
  
  def exams
      render :json => "exams json"
  end

  def grades
      render :json => "grades json"
  end
  
end
