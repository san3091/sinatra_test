require 'sinatra'
require 'httparty'
require 'nokogiri'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/aapl' do
	response = HTTParty.get("http://finance.yahoo.com/q?s=AAPL")
  dom = Nokogiri::HTML(response.body)
  stock_price_span = dom.xpath("//span[@id='yfs_l84_aapl']")
  appl_stock_price = stock_price_span.text
  "The current apple stock price is: $#{appl_stock_price.to_s}"
end
