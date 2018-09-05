module Methods

    def self.cash_deposit(account)
        puts "Hello #{account.account_name}! Your current balance is $#{account.account_balance}"
        print "How much would you like to deposit? "
        new_deposit = gets.strip.to_f
        account.account_balance = account.account_balance + new_deposit
        puts "
        Successfully deposited $#{new_deposit} to your account!
        Your current account balance is $#{account.account_balance}
        "
        self.back_to_menu(account)
    end

    def Methods.back_to_menu(account)
        print "Press 'X' to go to Menu..."
        user_input = gets.strip.downcase
            if user_input == 'x'
                self.display_menu(account)
            else 
                self.back_to_menu(account)
            end
    end

    def self.display_menu(account)
        puts """
        Menu
        
        [D] Cash Deposit
        [W] My Watchlist
        [P] Stock price
        [E] PE Ratio
        [C] Change Percentage
        [I] Invest
        [S] Cart
        
        """
        self.menu_selection(account)
    end

    def self.menu_selection(account)
        print "Please select directory: "
        menu_selection = gets.strip.upcase
        case menu_selection
        when "D"
            self.cash_deposit(account)
        when "W"
            self.my_watchlist(account)
        when "P"
            self.display_price(account)
        when "E"
            self.display_ratio(account)
        when "C"
            self.display_percent(account)
        when "I"
            self.invest(account)
        when "S"
            self.display_cart(account)
        else
            self.menu_selection(account)
        end
    end

    def self.my_watchlist(account)
        account.user_stocks.each_with_index do |name, index|
            require 'colorize'
            if account.user_stocks[index].change_percent >= 0 
                x = account.user_stocks[index].change_percent.to_s.colorize(:green)
            else
                x = account.user_stocks[index].change_percent.to_s.colorize(:red)
            end

        print """
         #{index+1}. #{account.user_stocks[index].name}
         Symbol: #{account.user_stocks[index].symbol}
         Price: #{account.user_stocks[index].price}
         PE Ratio: #{account.user_stocks[index].pe_ratio}
         % Change: #{x}
         """
        end

        self.back_to_menu(account)
    end

    def self.display_price(account)
        account.user_stocks.each_with_index do |name, index|
        print "
        #{index+1}. #{account.user_stocks[index].name}
        Price: #{account.user_stocks[index].price} \n"
        puts ""
        end
        self.back_to_menu(account)
    end

    def self.display_ratio(account)
        account.user_stocks.each_with_index do |name, index|
        print "
        #{index+1}. #{account.user_stocks[index].name}
        PE Ratio: #{account.user_stocks[index].pe_ratio} \n"
        puts ""
        end
        self.back_to_menu(account)
    end

    def self.display_percent(account)
        account.user_stocks.each_with_index do |name, index|
            require 'colorize'
            if account.user_stocks[index].change_percent >= 0 
                x = account.user_stocks[index].change_percent.to_s.colorize(:green)
            else
                x = account.user_stocks[index].change_percent.to_s.colorize(:red)
            end

        print "
        #{index+1}. #{account.user_stocks[index].name}
        % Change: #{x} \n"
        puts ""
        end
        self.back_to_menu(account)
    end

    def self.invest(account)
        puts "Which stock would you like to invest in? (symbol) "
        order_stock = gets.strip.upcase
        puts "Quantity of shares? "
        order_quantity = gets.strip.to_i

        chosen_stock = account.user_stocks.find do |stock|
            stock.symbol == order_stock
        end 

        order_cost = (chosen_stock.price * order_quantity)

        if account.account_balance >= order_cost
            account.account_balance = account.account_balance - order_cost
            chosen_stock.quantity = order_quantity
            chosen_stock.subtotal_cost = order_cost
            account.cart << chosen_stock
            puts "
            Successfully added #{order_quantity} shares of #{chosen_stock.name} stock to cart!
            Total cost: #{order_cost}
            Current account balance: #{account.account_balance}
            "
        else
            puts "Error! Insufficient funds!!!!"
        end

        self.back_to_menu(account)
    end

    def self.display_cart(account)
        account.cart.each_with_index do |stock, index|
        print "
        #{index+1}. #{account.cart[index].name}
        Symbol: #{account.cart[index].symbol})
        Quantity: #{account.cart[index].quantity}
        Cost: #{account.cart[index].subtotal_cost}
        "
        end
        
        self.back_to_menu(account)
    end
end


