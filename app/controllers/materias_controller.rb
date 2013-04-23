class MateriasController < ApplicationController
  # GET /materias 
  # GET /materias.json 

  helper_method :sort_column, :sort_direction

   def index
  if (params[:limit] == nil) or (params[:limit] <= '0') then
   params[:limit] = 2
  end
     @materias = Materia.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
  respond_to do |format| 
  format.html 
  format.json { render :json => @materias } 
  end
 end

  # GET /materias/1
  # GET /materias/1.json
  def show
    @materia = Materia.find(params[:id])
  end

  # GET /materias/new
  # GET /materias/new.json
  def new
    @materia = Materia.new
  end

  # GET /materias/1/edit
  def edit
    @materia = Materia.find(params[:id])
  end

  # POST /materias
  # POST /materias.json
  def create
    @materia = Materia.new(params[:materia])
    render :action => :new unless @materia.save
  end

  # PUT /materias/1
  # PUT /materias/1.json
  def update
    @materia = Materia.find(params[:id])
    render :action => :edit unless @materia.update_attributes(params[:materia])
  end

  # DELETE /materias/1
  # DELETE /materias/1.json
  def destroy
    @materia = Materia.find(params[:id])
    @materia.destroy
  end

  private

  def sort_column

   Materia.column_names.include?(params[:sort]) ? params[:sort] : "id"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end

end
