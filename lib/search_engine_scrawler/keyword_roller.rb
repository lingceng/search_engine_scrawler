require 'search_engine_scrawler/concurent_helper.rb'

module SearchEngineScrawler

  class KeywordRoller

    def initialize(scrawler, max: 20)
      @scrawler = scrawler

      @all = []
      @current = []
      @current_related = []

      @max = max
      @generation = 0
    end


    def roll(keyword)
      current = Array(keyword)
      @all.push(*current)

      return @all unless @all.size < @max

      puts "Generation #{@generation += 1} start ======="
      puts current

      current_related = ConcurrentHelper.together(current) do |c|
        @scrawler.fetch_related_keywords(c)
      end

      roll( new_guys(current_related) )
    end

    private

    def new_guys(keywords)
      keywords.flatten.uniq - @all
    end

  end

end

