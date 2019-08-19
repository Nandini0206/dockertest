require 'nokogiri'
require_relative 'fetch'

class Scraper
  def initialize
    @url = 'https://www.bbc.co.uk/sport'
    @fetch = fetch
  end

  def data
    array =  []
    @fetch.each do |article|
      array << { title: title(article), category: category(article) }
      # puts category(article)
    end
    return array

    # TODO
    # take the response from #fetch and return an array of maps containing
    # a title key and a category key. Use the #title and #category methods
    # Example:
    # [{category: "Cricket", title: "'Quite incredible' - Roy loses shoe"},
    #  {category: "Boxing", title: "Wait for facts before judging Whyte - Hearn"}]
  end

  private
  def fetch
    @fetch ||= Fetch.new(@url).request
      .css('.sp-qa-top-stories')
      .css('.gel-layout__item')
  end

  def title(article)
    article.css('h3').text
  end

  def category(article)
    article.css('ul.gs-o-list-inline').css('a').text
  end
end
