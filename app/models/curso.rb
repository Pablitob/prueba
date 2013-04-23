class Curso < ActiveRecord::Base

	has_many :horarios
	has_many :estudiantes
	def self.search(search) 	
		where("nombre like '%#{search}%' or ficha like '%#{search}%' " )
	end
  attr_accessible :ficha, :nombre

  validates :nombre, :presence => true, :length => { :maximum => 80 } 
	

end
