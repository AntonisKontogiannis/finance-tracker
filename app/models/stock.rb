class Stock < ApplicationRecord 
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    validates :symbol, presence: true

    def self.new_lookup(ticker_symbol)
        @stock = Alphavantage::Stock.new symbol: ticker_symbol, key: Rails.application.credentials.alpha_vantage_client[:api_key]
        #@stock = @stock.quote
    end

    def self.check_db(ticker_symbol)
       where(symbol: ticker_symbol).first 
    end
end
