class AccountsController < ApplicationController

  def user_info
    @user = current_user
  end

  def update_user_info
    @user = current_user

    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.date_of_birth = DateTime.parse(user_params[:date_of_birth])
    @user.gender = user_params[:gender]
    @user.bio = user_params[:bio]

    if user_params[:avatar].present?
      @user.avatar.attach(user_params[:avatar])
    end

    if @user.save
      redirect_to account_user_info_path, notice: "Ваши  данные успешно обновлены."
    else
      flash[:alert] = "При обновлении данных возникли ошибки."
      render :user_info
    end
  end

  def notifications
    @notifications = Notification.where(user: current_user).page params[:page]
  end

  def my_posts
    @posts = Post.where(user: current_user).page params[:page]
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :gender, :bio, :avatar)
  end

end
