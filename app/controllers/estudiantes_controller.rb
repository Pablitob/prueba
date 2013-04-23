  class EstudiantesController < ApplicationController
 
before_filter :find_curso_estudiantes
helper_method :sort_column, :sort_direction


  def index
    if (params[:limit] == nil) or (params[:limit] <= '0') then
     params[:limit] = 2
    end
    @estudiantes = Estudiante.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format| 
    format.html 
    format.json { render :json => @estudiantes } 
    end
 end


def show
  if params[:format] == "pdf" then
      pdf = EstudiantePdf.new(@estudiante, view_context)
      send_data pdf.render, filename: "estudiante_#{@estudiante.id}.pdf",
      type: "application/pdf"    
  end
 end

def new
    @estudiante = Estudiante.new
end

def edit
    #@estudiante = Estudiante.find(params[:id])
end

def create
  @estudiante = @curso.estudiantes.build(params[:estudiante])
  render :action => :new unless @estudiante.save
end

def update
 render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
end

def destroy
  @estudiante.destroy
end

private

def find_curso_estudiantes
  @curso = Curso.find(params[:curso_id])
  @estudiante = Estudiante.find(params[:id]) if params[:id]
end

  def sort_column

   Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "id"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end

end