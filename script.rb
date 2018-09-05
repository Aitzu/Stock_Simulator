=begin

** menu-deposit cash
run the program, show the current balance and print "Hello~ how much are you investing today?"
user type in an interger
print "are you deposting #{amount}? Y to confirm N to cancel"
change the user's account balance
print out account info
print "press something to continue depositing or X to go back to menu"

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
