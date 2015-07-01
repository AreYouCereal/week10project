class UsersController < ApplicationController
# Hartls below
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

# new app for sending mailer


def create
  @user = User.new(user_params)
  if user.save
    redirect_to @user
  else
    render 'new'
  end
end


#     if @user.save
#
#       # Sends email to user when user is created.
#       SendEmailJob.set(wait: 20.seconds).perform_later(@user)
#       # Below might need to be commented if error
#       ExampleMailer.sample_email(@user).deliver
#
#       format.html { redirect_to @user, notice: 'User was successfully created.' }
#       format.json { render :show, status: :created, location: @user }
#     else
#       format.html { render :new }
#       format.json { render json: @user.errors, status: :unprocessable_entity }
#     end
#   end
# end
