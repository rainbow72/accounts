class TransactionsController < ApplicationController
  require "date"
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @d = Date.today
    @transactions = current_user.transactions.where(tdate: @d.beginning_of_month...@d.end_of_month).order(tdate: :desc)
  end
  
  def new
    @transaction = current_user.transactions.new
    @categories = Category.all
    @subcategories = Subcategory.where(category_id: params[:category_id])
  end
  
  def create
    @transaction = current_user.transactions.build(transaction_params)
    @categories = Category.all
    @subcategories = Subcategory.where(category_id: params[:category_id])
    if @transaction.save
      flash[:success] = "入出金記録を1件追加しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "入出金記録を追加できませんでした。"
      render :new
    end
  end

  def show
    redirect_to edit_transaction_path
  end
  
  def edit
    @transaction = current_user.transactions.find(params[:id])
    @categories = Category.all()
    @subcategories = Subcategory.where(category_id: @transaction.category_id)
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:success] = "入出金記録を更新しました。"
      redirect_to transactions_path
    else
      flash.now[:danger] = "入出金記録を更新できませんでした。"
      render :edit
    end
  end
  
  def destroy
    @transaction.destroy
    flash[:success] = "1件の入出金記録を削除しました。"
    redirect_to transactions_path
  end
  
  def search
    @d = Date.new(
      params["tdate(1i)"].to_i,
      params["tdate(2i)"].to_i,
      params["tdate(3i)"].to_i
    )
    @transactions = current_user.transactions.where(tdate: @d.beginning_of_month...@d.end_of_month)
  end
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:tdate, :description, :amount, :category_id, :subcategory_id, :user_id)
  end

  def correct_user
    @transaction = current_user.transactions.find_by(id: params[:id])
    unless @transaction
      redirect_to root_url
    end
  end
end
