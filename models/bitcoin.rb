class Bitcoin

  API_URL = "https://api.coindesk.com/v1/bpi/currentprice/BTC.json"

  def self.search
    loop do
      price = fetch_btc_price
      puts "The price of BTC in dollars at the moment is #{price}"

      sleep 3
    end
  end
  
  private 

  def self.fetch_btc_price
    url = URI(API_URL)

    response = Net::HTTP.get(url)

    data = JSON.parse(response)

    data["bpi"]["USD"]["rate"]
  end
end