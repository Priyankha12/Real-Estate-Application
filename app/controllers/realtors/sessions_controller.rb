# frozen_string_literal: true

class Realtors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_action :set_realtor, only: [:show]#, :edit, :update, :destroy]

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
   # @realtor = Realtor.find(params[:id])
  #end
   #def after_sign_in_path_for(resource)
    #  "realtors#show"
   #end
end
