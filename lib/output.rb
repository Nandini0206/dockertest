require_relative 'scraper'

class Output
  NEWLINE = "\n"

  def initialize
    @data = Scraper.new.data
  end

  def print
    organise(@data).each do |articles|
      puts articles.first
      puts articles.last.map { |text| '  %s' % text}
      puts NEWLINE
    end
  end

  private
  def organise(data)
    # TODO
    # Using the data argument, organise the articles by category and return
    # a hash where the keys are the categories and the values are
    # arrays that contain each article of that category. Example:
    # {
    #    "Cricket" => ["'Quite incredible' - Roy loses shoe"],
    #    "Boxing" => ["Wait for facts before judging Whyte - Hearn",
    #                 "Some more boxing news I am creating"]
    #  }
  end
end
