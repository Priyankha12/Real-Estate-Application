class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

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

    house=House.find(params[:id])

    @hunters=[]
    if house.hunter_ids != nil
    house.hunter_ids.scan(/\d+/) do |hunter_id|
      #puts hunter_id
      @hunters.push(Hunter.find(hunter_id.to_s))
    end
      end


  end

  def search
  end

  def find

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




    houses_price = House.where("price BETWEEN #{price_from} AND #{price_to}")

      houses_sqft = House.where("square_footage BETWEEN #{sqft_from} AND #{sqft_to}")

    if params[:location] != ""
      houses_location = House.where("location = ?","#{params[:location]}")
    else
      houses_location = House.all
    end

    @houses= houses_price & houses_sqft & houses_location
  end

  def add_interest

    if params[:interest]
    params[:interest].each do |house|
      @house=House.find(house)
      hunters= []
      if @house.hunter_ids != nil
        hunters=@house.hunter_ids.split(/\s/)
        else @house.hunter_ids=""
      end

      if hunters.include? "#{current_hunter.id}"
        hunters.delete("#{current_hunter.id}")
        @house.hunter_ids=hunters.join(" ")
      else
          @house.hunter_ids = @house.hunter_ids + " #{current_hunter.id}"
        end

      @house.save

    end
    end
    @houses=House.all
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:id, :real_estate_company_id, :location, :square_footage, :year, :style, :price, :floors, :basement, :current_owner, :realtor_id, :image)
    end



end
