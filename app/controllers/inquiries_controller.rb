class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  before_action :inquiry_params, only: [:update]

  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = []
    if (realtor_signed_in?)
      Inquiry.select("id , house_id").each do |inquiry|
        #if(house.real_estate_company_id==current_ra)
        #puts house
        if (House.find(inquiry.house_id).real_estate_company_id == current_realtor.real_estate_company_id)
          @inquiries.push(Inquiry.find(inquiry.id))
        end
      end
    else
    @inquiries=Inquiry.all
  end
end
  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
    @house_id = params[:house]
  end

  # GET /inquiries/1/edit
  def edit
    @house_id = @inquiry.house_id
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)

    respond_to do |format|
      if @inquiry.save
        format.html {redirect_to @inquiry, notice: 'Inquiry was successfully created.'}
        format.json {render :show, status: :created, location: @inquiry}
      else
        format.html {render :new}
        format.json {render json: @inquiry.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
   # puts ("Parameters are:")
   # puts params["replies"]
    if realtor_signed_in?
      if (@inquiry.replies != "")
        new_replies = @inquiry.replies + "\nRealtor #{current_realtor.id} : " + params[:replies]

      else
        new_replies = "Realtor #{current_realtor.id} : " + params[:replies]
      end
      #puts @inquiry.hunter.email
      #RealtorMailer.with(hunter: @inquiry.hunter.email, replies: params[:replies], realtor: current_realtor.email).reply_email.deliver_now
      respond_to do |format|
        if @inquiry.update_attribute(:replies, new_replies)
          format.html {redirect_to @inquiry, notice: 'Inquiry was successfully replied.'}
          format.json {render :show, status: :ok, location: @inquiry}
        else
          format.html {render :edit}
          format.json {render json: @inquiry.errors, status: :unprocessable_entity}
        end
      end

  else
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html {redirect_to @inquiry, notice: 'Inquiry was successfully updated.'}
        format.json {render :show, status: :ok, location: @inquiry}
      else
        format.html {render :edit}
        format.json {render json: @inquiry.errors, status: :unprocessable_entity}
      end
    end
    end
    end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html {redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
   # @replies=params[:replies].to_s
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def inquiry_params
    params.require(:inquiry).permit(:id, :house_id, :hunter_id, :subject, :message, :replies)
  end
end
