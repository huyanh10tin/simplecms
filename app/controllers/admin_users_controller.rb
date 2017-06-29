class AdminUsersController < ApplicationController
  	layout 'admin'
	before_action :confirm_logged_in
	def index
		@admins = AdminUser.sorted
	end
	def new
		@admin = AdminUser.new
	end
	def create
		@admin = AdminUser.new(admin_params)
		if @admin.save
			flash[:notice] = "Admin Create Successful!."
			redirect_to(admin_users_path)
		else
			flash.now[:notice] = "Not Successful"
  			render('new')
		end
	end
	def edit
		@admin = AdminUser.find(params[:id])
	
	end
	def update
		@admin = AdminUser.find(params[:id])
    
	    if(@admin.update_attributes(admin_params))
	      flash[:notice] = "Admin edited successfully"
	      redirect_to(admin_users_path)
	    else
	      render('edit')
    	end
	end
	def show
	end
	def delete
		@admin = AdminUser.find(params[:id])
	end
	def destroy
		@admin = AdminUser.find(params[:id])
		@admin.destroy
		flash[:notice] = "Admin user deleted Successful!"
		redirect_to(admin_users_path)
	end
	private
	def admin_params
		params.require(:admin_user).permit(:first_name,:last_name,:email,:username,:password)
	end
end
