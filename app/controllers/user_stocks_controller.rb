class UserStocksController < ApplicationController
    def create
        if !current_user.stocks.pluck(:symbol).include?(params[:symbol])
            stock = Stock.new_lookup(params[:symbol])
            @stock = Stock.create(symbol: params[:symbol], previous_close: stock.quote.previous_close)
            @user_stock = UserStock.create(user_id: current_user.id, stock_id: @stock.id)
            flash[:notice] = "Stock #{@stock.symbol} added to portfolio"
            redirect_to my_portfolio_path
        end
    end

    def destroy
        stock = Stock.find(params[:id])
        user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        user_stock.destroy
        flash[:alert] = "#{stock.symbol} removed from your portfolio"
        redirect_to my_portfolio_path
    end
end
