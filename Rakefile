require "bundler/gem_tasks"
require "search_engine_scrawler"


desc 'fetch sites with scrawler'
task :fetch  do
  puts "Start fetch"

  scrawler = SearchEngineScrawler::BaiduScrawler.new
  roller = SearchEngineScrawler::KeywordRoller.new(scrawler)
  keywords = roller.roll('ruby')

  keywords.each do |keyword|
    puts "Sites for [#{keyword}] ====== "
    puts scrawler.fetch_sites(keyword)
  end

  puts "End fetch"
end
