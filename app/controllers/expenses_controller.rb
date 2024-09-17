class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  def index
    @expenses = current_user.expenses
    render json: @expenses
  end

  # GET /expenses/:id
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/:id
  def update
    if @expense.update(expense_params)
      render json: @expense, status: :ok
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/:id
  def destroy
    @expense.destroy
    head :no_content
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :description, :category, :date)
  end
end
