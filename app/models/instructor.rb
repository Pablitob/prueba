class Instructor < ActiveRecord::Base

	has_many :horarios
	 def self.search(search) 	
		where("nombres like '%#{search}%' or cedula like '%#{search}%'  or direccion like '%#{search}%' or email like '%#{search}%' or telefono like '%#{search}%' or modalidad like '%#{search}%'" )
  end
  attr_accessible :cedula, :direccion, :email, :fch_ncto, :modalidad, :nombres, :telefono
  validates :nombres, :presence => true, :length => { :maximum => 80 } 
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A[\w+\.]+@[a-z\d\.]+\.[a-z]+\z/i }
  validates :cedula, :presence => true, :length => { :minimun => 6, :maximum => 15 }, :numericality => true
  validates :direccion, :presence => true
  validates :telefono, :presence => true, :length => { :minimun => 7, :maximum => 10 }, :numericality => true
  validates :modalidad, :presence => true, :length => { :maximum => 1 }, :numericality => true
end
