class Admin::CarrieresController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_carriere, only: [:show, :edit, :update, :destroy]
  layout "applicationadmin"

  # GET /carrieres
  # GET /carrieres.json
  def index
    @carrieres = Carriere.all.order("created_at DESC")
  end

  # GET /carrieres/1
  # GET /carrieres/1.json
  def show
  end

  # GET /carrieres/new
  def new
    @carriere = Carriere.new
  end

  # GET /carrieres/1/edit
  def edit
  end

  # POST /carrieres
  # POST /carrieres.json
  def create
    @carriere = Carriere.new(carriere_params)

    respond_to do |format|
      if @carriere.save
        format.html { redirect_to @carriere, notice: 'Carrière a été créée avec succès.' }
        format.json { render :show, status: :created, location: @carriere }
      else
        format.html { render :new }
        format.json { render json: @carriere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrieres/1
  # PATCH/PUT /carrieres/1.json
  def update
    respond_to do |format|
      if @carriere.update(carriere_params)
        format.html { redirect_to @carriere, notice: 'Carriere a été mis à jour avec succès.' }
        format.json { render :show, status: :ok, location: @carriere }
      else
        format.html { render :edit }
        format.json { render json: @carriere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrieres/1
  # DELETE /carrieres/1.json
  def destroy
    @carriere.destroy
    respond_to do |format|
      format.html { redirect_to admin_carrieres_path, notice: 'Carrière a été détruite avec succès.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carriere
      @carriere = Carriere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carriere_params
      params.require(:carriere).permit(:nom, :email, :sujet, :message, :cv, :lettre)
    end
end
