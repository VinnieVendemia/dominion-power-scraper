
load 'lib/dominion-power-scraper.rb'

# navigate to the correct page 
d = DominionPower::Driver.new 
d.visit_dominion_power
d.login(ENV['username'], ENV['password'])
d.goto_payment_history

# scraper bill info 
scraper = DominionPower::Scraper.new d.driver
scraper.get_latest_bill_info

# get energy info 
d.goto_energy_usage
scraper.get_energy_usage

# output everything 
puts "Energy usage was #{scraper.usage[:usage]}"
puts "This was measured from #{scraper.usage[:service_start_date]} to #{scraper.bill[:service_end_date]}"
puts "Your bill is #{scraper.bill[:bill_amount]}"
puts "It is due on #{scraper.bill[:due_date]}"
