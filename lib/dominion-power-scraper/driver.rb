

module DominionPower
    class Driver

      attr_accessor :driver
      def initialize
        @driver = Capybara::Session.new :selenium
      end

      def visit_dominion_power
        puts "Going to site"
        @driver.visit "https://www.dom.com/residential/dominion-virginia-power"
      end

      def login(username, password)
        puts "Logging in"
        @driver.fill_in "User Name:", with: username
        @driver.fill_in "Password:", with: password
        @driver.click_button "Sign In"
      end

      def goto_payment_history
        puts "Going to payment history section"
        @driver.click_link "Payment History"
      end

      def goto_energy_usage
        puts "Going to energy usage"
        @driver.select "Usage", :from => "ddlStatementTypeDropdownList"
        @driver.click_button "Search"
      end

    end
end
