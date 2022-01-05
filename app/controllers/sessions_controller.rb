class SessionsController < ApplicationController
	skip_before_action :ensure_login, only: [:new, :create, :signup, :create_account]
  def new
  end

  def signup
  end

  def create_account
    reviewer = Reviewer.create(name: params[:reviewer][:name], password: params[:reviewer][:password])
    if reviewer.authenticate(params[:reviewer][:password])
      session[:reviewer_id] = reviewer.id
      redirect_to root_path, notice: "Logged in successfully..."  
    else
      redirect_to login_path, alert: "Failed to create the account!"
    end
  end
  def create
  	reviewer = Reviewer.find_by(name: params[:reviewer][:name])
  	# Get the password and authenticate the user
  	password = params[:reviewer][:password]
  	if reviewer && reviewer.authenticate(password)
  		session[:reviewer_id] = reviewer.id
  		redirect_to root_path, notice: "Logged in successfully..."  		
  	else
  		redirect_to login_path, alert: "Invalid username/password combination"
  	end
  end

  def destroy
  	# Here we will wipe everything
  	reset_session
  	redirect_to login_path, notice: "You have been logged out"
  end

  def reviewer_params
    #params.require(:reviewer).permit(:name, :password)
  end
end
