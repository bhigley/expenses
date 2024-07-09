class ExpensesController < ApplicationController
  before_action :require_login
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.new(expense_params)

    if @expense.save
      redirect_to @expense
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to @expense
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def expense_params
    params.require(:expense).permit(:month, :year, :total, :user)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
