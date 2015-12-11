# Dominion Power Scraper 
====================

The `dominion-power-scraper` is responsible for scraping client information from [Dominion Power's website](https://www.dom.com/residential/dominion-virginia-power)

## Usage 

### Console usage

You can use the console to test functionality or add new.  To use: 

```shell
$ bundle exec bin/console 
```

From here, you can run commands such as: 

```
d = DominionPower::Driver.new
d.visit_dominion_power
```

This will give u a session and take you to the dominion power website.  Interact with the page through 

```
d.driver 
```

### Rake usage

To get the bill info for a particular client, use the following rake task

```shell
$ username={X} password={X} bundle exec rake scraper:scrape
```

## Wishlist 

-  Replace puts statements with [logging gem](https://github.com/TwP/logging)
-  Grab all historical data for a client 
-  Add multi-threaded functionality to scrape multiple clients at once 
