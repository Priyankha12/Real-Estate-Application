# frozen_string_literal: true

class Realtors::RegistrationsController < Devise::RegistrationsController
   before_action :realtor_params, only: [:create, :update]
   before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     #@realtor = Realtor.new(realtor_params)
     @realtor = Realtor.new(realtor_params)
     #puts(realtor_params)
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

  # GET /resource/edit
   def edit

   end

  # PUT /resource
   def update
     @old_realtor = Realtor.find_by(email: params[:realtor][:email])

super
@realtor=Realtor.find_by(email: params[:realtor][:email])
if not @realtor.real_estate_company_id or @old_realtor.real_estate_company_id != @realtor.real_estate_company_id
  new_realtor = Realtor.find_by real_estate_company_id: @old_realtor.real_estate_company_id
  if not new_realtor
    new_realtor = Realtor.create({id: Realtor.last.id+1, email: 'dummy@gmail.com', password: 'dummmy', name: 'dummy', phone: '919', real_estate_company_id: @old_realtor.real_estate_company_id})
  end
  House.where("realtor_id=#{@old_realtor.id}").each {|house| house.update_attribute(:realtor_id, new_realtor.id)}
end

   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  def realtor_params
        params.require(:realtor).permit(:email, :name, :password, :real_estate_company_id, :phone)
  end

   def update_params
     params.require(:realtor).permit(:email, :name, :password, :real_estate_company_id, :phone)
   end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name,:real_estate_company_id,:phone])
   end


end
