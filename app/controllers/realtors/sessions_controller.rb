# frozen_string_literal: true

class Realtors::SessionsController < Devise::SessionsController

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

   def after_sign_in_path_for(resource)
      current_realtor
   end
end
