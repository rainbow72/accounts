class TransactionsController < ApplicationController

  def index
    @year = Time.now.year
    @month = Time.now.month
    @transactions = Transaction.order(t_date: :desc)
  end
  
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
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
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:t_date, :description, :amount, :perticular_id)
  end
end
