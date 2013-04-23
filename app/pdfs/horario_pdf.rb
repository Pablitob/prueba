class HorarioPdf < Prawn::Document

 def initialize(horario, view)
    super()
    @horario = horario
    @view = view
    logo
    vista
  end

  def logo
  	logopath = "#{Rails.root}/app/assets/images/pdf.png"
  	image logopath
  end

  def vista
  	move_down (30)
  	table ([["Horario No", "#{@horario.id}"],
  			["Hora ", "#{@horario.hora}"],
  			["Aula ", "#{@horario.aula}"],
  			["Curso ", "#{@horario.curso.nombre}"],
  			["Materia", "#{@horario.materia.nombres}"],
  			["Instructor", "#{@horario.instructor.nombres}"],
  		]), :width => 400 do
  			columns(1).align = :center
  		self.header = true
  		self.column_widths = {0 => 200, 3 => 100}  	
  		columns(2).font_style = :bold	
  		end
  end
end