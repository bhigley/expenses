class UsersController < ApplicationController

  def home
  end
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @expenses = Expense.where(user_id: @user.id).order(month: :asc, year: :asc)
    @total_expenses = @expenses.sum(:total)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  def login
    show
    if (user_params[:password] == @user[:password])
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
