# frozen_string_literal: true

class Realtors::SessionsController < Devise::SessionsController

 # before_action :configure_sign_in_params, only: [:create]
  #before_action :set_realtor, only: [:show]#, :edit, :update, :destroy]
  #after_action :set_realtor, only: [:create]
  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     #params[:id] = current_realtor.id
     super
   end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  #
  #private

  #def set_realtor
   # @realtor = Realtor.
  #end
   def after_sign_in_path_for(resource)
     #format.html { redirect_to current_realtor, notice: 'Realtor successfully signed in.' }
     #format.html { redirect_to realtor_path, notice: 'Realtor successfully signed in.' }
      current_realtor
   end
end
