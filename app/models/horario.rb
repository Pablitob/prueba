class Horario < ActiveRecord::Base

	 def self.search(search) 	
		where("aula like '%#{search}%'" )
  end
  attr_accessible :aula, :curso_id, :dia, :hora, :instructor_id, :materia_id, :materia_nombres
  validates :aula, :presence => true


  belongs_to :materia
   belongs_to :instructor
    belongs_to :curso

      def instructor_nombre
      instructor.nombre if instructor
  end

  def instructor_nombre=(nombre)
    self.instructor = Instructor.find_or_create_by_nombre(nombre) unless nombre.blank?      
  end

  def curso_nombre
      curso.nombre if curso
  end

  def curso_nombre=(nombre)
    self.curso = Curso.find_or_create_by_nombre(nombre) unless nombre.blank?      
  end

  def materia_nombre
      materia.nombre if materia
  end

  def materia_nombre=(nombre)
    self.materia = Materia.find_or_create_by_nombres(nombre) unless nombre.blank?      
  end
    
end
