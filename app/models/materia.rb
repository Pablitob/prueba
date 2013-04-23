class Materia < ActiveRecord::Base

  has_many :horarios
  def self.search(search) 	
		where('nombres like ?', "%#{search}%") 
  end
  attr_accessible :nombres
  validates :nombres, :presence => true, :length => { :maximum => 80 } 
 
end
