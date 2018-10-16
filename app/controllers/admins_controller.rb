class AdminsController < ApplicationController
  before_action :set_admin, only: [:show]
  before_action :create_admin, only: [:index]
  # GET /admins
  # GET /admins.json
  def index #root url
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

    def set_admin
       @admin = Admin.find(params[:id])
     end

   def create_admin
     if(Admin.first.nil?)
       admin = Admin.create({:email => "admin@gmail.com", :name => "Admin", :password => "password"})
     elsif Admin.first.password == nil
       admin=Admin.first
       admin.password="password"
       admin.save
     end
 # end
   end
  end
