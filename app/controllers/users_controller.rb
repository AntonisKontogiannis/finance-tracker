class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def search
    if params[:user].present?
      if User.where(first_name: params[:user]).any?
        @friend1 = User.where(first_name: params[:user])
      end
      if User.where(last_name: params[:user]).any?
        @friend1 = User.where(last_name: params[:user])
      end
      if User.where(email: params[:user]).any?
        @friend1 = User.where(email: params[:user])
      end
      if !@friend1
        flash[:alert] = "Couldn't find any user"
        redirect_to friendships_path
      end       
    else
      flash[:alert] = "Please enter an attribute to search"
      redirect_to friendships_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

end


