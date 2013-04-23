class HorariosController < ApplicationController
  # GET /cursos
  # GET /cursos.json
before_filter :find_horario
helper_method :sort_column, :sort_direction
autocomplete :materia, :nombres, :full => true

  def index
  if (params[:limit] == nil) or (params[:limit] <= '0') then
   params[:limit] = 2
  end
 @horarios = Horario.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
  respond_to do |format| 
  format.html 
  format.json { render :json => @horarios } 
  end
 end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    @horario = Horario.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = HorarioPdf.new(@horario, view_context)
        send_data pdf.render, filename: 
        "horario_#{@horario.id}.pdf",
        type: "application/pdf"
      end
    end
  end

  # GET /cursos/new
  # GET /cursos/new.json
  def new
    @horario = Horario.new
  end

  # GET /cursos/1/edit
  def edit
    @horario = Horario.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @horario = Horario.new(params[:horario])
    render :action => :new unless @horario.save
  end

  # PUT /cursos/1
  # PUT /cursos/1.json
  def update
    @horario = Horario.find(params[:id])
     render :action => :edit unless @horario.update_attributes(params[:horario])
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @horario = Horario.find(params[:id])
    @horario.destroy
  end

  def find_horario
    @horario = Horario.find(params[:id]) if params[:id]
  end

  private

  def sort_column

   Horario.column_names.include?(params[:sort]) ? params[:sort] : "id"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end

end