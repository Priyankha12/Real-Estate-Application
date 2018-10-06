class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_realtor! , except: [:index, :show]

  # GET /realtors
  # GET /realtors.json
  def index
    @realtors = Realtor.all
  end

  # GET /realtors/1
  # GET /realtors/1.json
  def show
  end

  # GET /realtors/new
  def new
    #puts(Realtor.column_names)
    @realtor = Realtor.new
  end

  # GET /realtors/1/edit
  def edit
    @old_realtor=@realtor
  end

  # POST /realtors
  # POST /realtors.json
  def create
    @realtor = Realtor.new(realtor_params)
    puts(realtor_params)
    #puts(Realtor.columns)
    respond_to do |format|
      if @realtor.save
        format.html { redirect_to @realtor, notice: 'Realtor was successfully created.' }
        format.json { render :show, status: :created, location: @realtor }
      else
        format.html { render :new }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realtors/1
  # PATCH/PUT /realtors/1.json
  def update
    respond_to do |format|
      if @realtor.update(realtor_params)
        if @old_realtor.real_estate_company_id != @realtor.real_estate_company_id or not @realtor.real_estate_company_id
          new_realtor = Realtor.find_by real_estate_company_id: @old_realtor.real_estate_company_id
          if not new_realtor
            new_realtor = Realtor.new({ email: 'dummy@gmail.com', encrypted_password: 'dummy', name: 'dummy', phone: '919', real_estate_company_id: @old_realtor.real_estate_company_id})
            new_realtor.save
          end
          House.where("realtor_id=#{@old_realtor.id}").each {|house| house.update_attribute(:realtor_id, new_realtor.id)}
        end

        format.html { redirect_to @realtor, notice: 'Realtor was successfully updated.' }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /realtors/1
  # DELETE /realtors/1.json
  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to :realtors, notice: 'Realtor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def realtor_houses
   # @realtor=Realtor.new(realtor_params)
  #puts(@houses)

  #session[:houses] = params[:houses]
   @id=params[:id]
  @houses=House.where("realtor_id=#{params[:id]}")
  puts(@houses)
  #respond_to do |format|
  #  format.html { redirect_to houses_url(@houses) }
  #  format.json { head :no_content }
  #puts "Reached"
   # puts params[:id]
  #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realtor_params
      params.require(:realtor).permit(:email, :name, :password, :real_estate_company_id, :phone)
    end
end
