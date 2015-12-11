


module DominionPower
  class Scraper

    SERVICE_END_DATE_INDEX = 0
    BILL_AMOUNT_INDEX = 1
    BILL_DUE_DATE_INDEX = 2
    KWH_INDEX = 4


    attr_accessor :session
    attr_accessor :bill, :usage
    def initialize(session)
      @session = session
    end

    def s
      @session
    end


    def get_latest_bill_info
      puts "Scraping latest bill info"
      table = s.find(:xpath, "//table[@id='billingAndPaymentsTable']")
      rows = table.all(:css, "tr")
      rows.each_with_index do |item, index|
        if index == 0
          puts "skip the first index, it's just the table headers"
          next
        end
        col = item.all(:css, "td")
        if is_a_bill?(col)
          parse_bill(col)
          return # got the latest bill
        end
      end
    end

    def parse_bill(col)
      @bill = {
        service_end_date: col[SERVICE_END_DATE_INDEX].text,
        bill_amount: col[BILL_AMOUNT_INDEX].text,
        due_date: col[BILL_DUE_DATE_INDEX].text
      }
    end

    # useful method for determining if a column in the
    # bills/payments table is a bill
    def is_a_bill?(col)
      if col[2].text.empty?
        return false
      end
      return true
    end

    # Get enerygy usage from all
    def get_energy_usage
      puts "Getting energy usage"
      table = s.find(:xpath, "//table[@id='paymentsTable']")
      rows = table.all(:css, "tr")
      parse_usage(rows)
    end

    def get_last_kwh(row)
      cols = row.all(:css, "td")
      cols[KWH_INDEX].text
    end

    def get_service_start_date(row)
      cols = row.all(:css, "td")
      cols.first.text 
    end

    def parse_usage(rows)

      kwh = get_last_kwh(rows[1])
      service_start_date = get_service_start_date(rows[2])

      @usage = {
        :usage => kwh,
        :service_start_date => service_start_date
      }
    end


    # gets the current amount the client needs to pay
    # not needed for the challenge, I was unsure what was needed
    # at first and wrote this ...
    def get_current_bill_information
      bill_info = s.all(:xpath, "//*[contains(@class,'bodyTextGreen')]")
      date = bill_info.first.text
      cost = bill_info.last.text

      {
        :date => date,
        :cost => cost
      }
    end

  end
end
