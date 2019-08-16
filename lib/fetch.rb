require 'nokogiri'
require 'open-uri'

class Fetch
  def initialize(url)
    @url = url
  end

  def request
    @html ||= Nokogiri::HTML(open(@url))
  end
end
