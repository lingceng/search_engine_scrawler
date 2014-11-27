require "bundler/gem_tasks"
require "search_engine_scrawler"


desc 'fetch sites with scrawler'
task :fetch  do
  puts "Start fetch"

  scrawler = SearchEngineScrawler::BaiduScrawler.new
  roller = SearchEngineScrawler::KeywordRoller.new(scrawler)
  puts roller.roll('ruby')


  puts "End fetch"
end
