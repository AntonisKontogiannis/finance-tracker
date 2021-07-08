class StocksController < ApplicationController
    
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            @stock = @stock.quote
            if @stock.previous_close 
                render 'users/my_portfolio'
            else
                flash[:alert] = "Enter a valid symbol to continue"
                redirect_to my_portfolio_path
            end    
        else
            flash[:alert] = "Please enter a symbol to search"
            redirect_to my_portfolio_path
        end
    end

end