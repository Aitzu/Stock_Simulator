# require gems
require 'stock_quote'
require 'colorize'

# require modules
require_relative 'methods.rb'

# create User class
class User

    attr_accessor :account_name, :account_balance, :user_stocks, :cart

    def initialize(name)
        @account_name = name
        @account_balance = 0
        @user_stocks = []
        @cart = []
    end

    def add_stock_to_portfolio(stock)
        @user_stocks << stock
    end
end

# create Stock class
class Stock

    attr_accessor(:name, :symbol, :price, :pe_ratio, :change_percent, :quantity, :subtotal_cost)

    def initialize(name, symbol, price, pe_ratio, change_percent)
        @name = name
        @symbol = symbol
        @price = StockQuote::Stock.quote(symbol).latest_price
        @pe_ratio = StockQuote::Stock.quote(symbol).pe_ratio
        @change_percent = StockQuote::Stock.quote(symbol).change_percent
        @quantity = quantity
        @subtotal_cost = subtotal_cost
    end

end

# Create User instances
account1 = User.new("Ben")
account2 = User.new("Aitzu")

# Create Stock instances
apple = Stock.new('Apple', 'AAPL', 0, 0, 0)
netflix = Stock.new('Netflix', "NFLX", 0, 0, 0)
facebook = Stock.new('Facebook', "FB", 0, 0, 0)
amazon = Stock.new('Amazon', "AMZN", 0, 0, 0)
amex = Stock.new('American Express', "AXP", 0, 0, 0)
tesla = Stock.new('Tesla', "TSLA", 0, 0, 0)
alibaba = Stock.new('Alibaba', "BABA", 0, 0, 0)
a_airlines = Stock.new('American Airlines', "AAL", 0, 0, 0)
nike = Stock.new('Nike', "NKE", 0, 0, 0)
j_j = Stock.new('Johnson & Johnson', "JNJ", 0, 0, 0)

# Add stocks to the user account2
account2.add_stock_to_portfolio(apple)
account2.add_stock_to_portfolio(netflix)
account2.add_stock_to_portfolio(facebook)
account2.add_stock_to_portfolio(amazon)
account2.add_stock_to_portfolio(amex)
account2.add_stock_to_portfolio(tesla)
account2.add_stock_to_portfolio(alibaba)
account2.add_stock_to_portfolio(a_airlines)
account2.add_stock_to_portfolio(nike)
account2.add_stock_to_portfolio(j_j)


# run the code 
Methods.cash_deposit(account2)

Methods.back_to_menu(account2)


=begin

** menu-deposit cash
run the program, show the current balance and print "Hello~ how much are you investing today?"
user type in an interger
print "are you deposting #{amount}? Y to confirm N to cancel"
change the user's account balance
print out account info
print "press something to continue depositing or X to go back to menu"
=end

# cash_deposit(account)

=begin
 ** menu
    - [D] cash deposit
    - [W] my watchlist (apple, microsoft, facebook, amazon, google, tesla, nestle, icbc, ibm, intel)
    - [I] invest
    - [S] checkout/summary
    - [P] stock price
    - [E] PE ratio
    - [C] change percentage

** cash deposit
how the current balance and print "Hello~ how much are you investing today?"
user type in an interger
print "are you deposting #{amount}? Y to confirm N to cancel"
change the user's account balance
print out account info
print "press something to continue depositing or X to go back to menu"

** my watchlist
print out all the stocks im watching. a hash a stocks with all info

** add stock to the cart 
print "which stock you are buying? (type in symbol)"
user input the symbol
print the stock info including stock name, symbol, latest price, pe ratio, change of percentage
print "how many shares you wanna buy? (type in the quantity)"
user input
print "#{quantity} shares of {symbol} successfully added to your cart!"
print "press C to add another stock or X to go back to menu"
(somewhere inside this function needs to add a control method making sure we are not overspending)


** stock price
print out the rank of all stocks im watching by the stock price (from high to low)
print "press X to go back to menu" 

** PE ratio
print out the rank of all stocks im watching by the PE ratio (from low to high)
print "press X to go back to menu" 

** change percentage
print out the rank of all stocks im watching by the change of percentage (the best to the worst)
use colorize gem
print "press X to go back to menu" 

** my cart/summary
print out all the stocks I've added to cart with all info 
    
=end

# def symbol ticker
#     symbol = StockQuote::Stock.quote(ticker).symbol
#     return "#{symbol}" if symbol
# end

# puts symbol('aapl')

# def co_name ticker
#     company_name = StockQuote::Stock.quote(ticker).company_name
#     return "#{company_name}" if company_name
# end

# puts co_name('aapl')

# def price ticker
#     latest_price = StockQuote::Stock.quote(ticker).latest_price
#     return "#{latest_price} (Latest Price)" if latest_price
# end

# puts price('aapl')

# def change_percent ticker
#     change_percent = StockQuote::Stock.quote(ticker).change_percent
#     return "#{change_percent} (Change Percent)" if change_percent
# end

# puts change_percent('aapl')

# def ratio ticker
#     pe_ratio = StockQuote::Stock.quote(ticker).pe_ratio
#     return "#{pe_ratio} (P/E Ratio)" if pe_ratio
# end

# puts ratio('aapl')
