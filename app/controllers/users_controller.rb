class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :only => :admin

  def admin
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    if current_user.id != @user.id
      redirect_to root_path
    end
    @page_title = "Profile"
  end

end
