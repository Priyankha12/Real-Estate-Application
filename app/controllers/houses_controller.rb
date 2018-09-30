class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_realtor! , except: [:index, :show]
  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create


    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def potential_hunters
    # @realtor=Realtor.new(realtor_params)
    #puts(@houses)

    #session[:houses] = params[:houses]
    #@id=params[:id]
    #@houses=Hunter.where("realtor_id=#{params[:id]}")
   # hunters_string= House.find(params[:id]).select("hunter_ids")
    #
   # query="select hunter_ids from houses where id=#{params[:id]}"

    house=House.find(params[:id])
    #results = ActiveRecord::Base.connection.execute(query)
  # puts(house.hunter_ids)
    @hunters=[]
    house.hunter_ids.scan(/\d+/) do |hunter_id|
      puts hunter_id
      #@hunters<<Hunter.find(hunter_id.to_i)
    end
    house.hunter_ids.scan(/\d+/) do |hunter_id|
      #puts hunter_id
      @hunters.push(Hunter.find(hunter_id.to_s))
    end

    #puts(@houses)
    #respond_to do |format|
    #  format.html { redirect_to houses_url(@houses) }
    #  format.json { head :no_content }
    #puts "Reached"
    # puts params[:id]
    #end
  end

  def search
  end

  def find
    #houses_price=House.all
    #houses_sqft=House.all
    #houses_location=House.all
    price_from=House.minimum(:price)
    price_to = House.maximum(:price)
    sqft_from = House.minimum("square_footage")
    sqft_to = House.maximum("square_footage")


    if(params[:price_from] != "")
      price_from=params[:price_from]
    end
    if(params[:price_to] != "")
      price_to=params[:price_to]
    end

    if(params[:sqft_from] != "")
      sqft_from=params[:sqft_from]
    end
    if(params[:sqft_to] != "")
      sqft_to=params[:sqft_to]
    end



   # if params[:price_from] != "" and params[:price_to] != ""
    houses_price = House.where("price BETWEEN #{price_from} AND #{price_to}")
    #end
    #if params[:sqft_from] != "" and params[:sqft_to] != ""
      houses_sqft = House.where("square_footage BETWEEN #{sqft_from} AND #{sqft_to}")
    #end
    if params[:location] != ""
      houses_location = House.where("location = ?","#{params[:location]}")
    else
      houses_location = House.all
    end

    @houses= houses_price & houses_sqft & houses_location
  end

  def add_interest
    #puts params[:interest]

    @houses=[]
    params[:interest].each do |house|
      @house=House.find(house)
      @house.hunter_ids = @house.hunter_ids + "#{current_hunter.id} "
      @house.save
      @houses.push(@house)
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
     # if(not realtor_signed_in?)
      params.require(:house).permit(:id, :real_estate_company_id, :location, :square_footage, :year, :style, :price, :floors, :basement, :current_owner, :realtor_id, :hunter_ids)
      #else
       # params.require(:house).permit(:id, :location, :square_footage, :year, :style, :price, :floors, :basement, :current_owner, :hunter_ids)
      #end
    end



end
