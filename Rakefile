require "bundler/gem_tasks"
require "search_engine_scrawler"


desc 'fetch sites with scrawler'
task :fetch  do
  puts "Start fetch"

  scrawler = SearchEngineScrawler::BaiduScrawler.new
  roller = SearchEngineScrawler::KeywordRoller.new(scrawler)
  keywords = roller.roll('ruby')

  sites = SearchEngineScrawler::ConcurrentHelper.together(keywords) do |keyword|
    puts "Feching sites for [#{keyword}]"
    scrawler.fetch_sites(keyword)
  end

  puts sites

  puts "End fetch"
end
