class TransactionsController < ApplicationController
  require "date"
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @d = Date.today
    @results = current_user.transactions.where(t_date: @d.beginning_of_month...@d.end_of_month)
  end
  
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.particular_id = 1
    if @transaction.save
      flash[:success] = "入出金記録を1件追加しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "入出金記録を追加できませんでした。"
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @transaction.update(transaction_params)
      flash[:success] = "入出金記録を更新しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "入出金記録を更新できませんでした。"
      render :edit
    end
  end
  
  def destroy
    @transaction.destroy
    flash[:success] = "1件の入出金記録を削除しました。"
    redirect_to transactions_url
  end
  
  def search
    @d = Date.new
    @results = current_user.transactions.where(t_date: @d.beginning_of_month...@d.end_of_month)
  end
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:t_date, :description, :amount, :user_id, :perticular_id)
  end

  def correct_user
    @transaction = current_user.transactions.find_by(id: params[:id])
    unless @transaction
      redirect_to root_url
    end
  end
end
