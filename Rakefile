require "bundler/gem_tasks"
require "search_engine_scrawler"


desc 'fetch sites with scrawler'
task :fetch, :keyword, :max  do |t, args|
  unless args[:keyword]
    puts "rake fetch[keyword]"
    next
  end

  puts "Start fetch"

  scrawler = SearchEngineScrawler::BaiduScrawler.new
  roller = SearchEngineScrawler::KeywordRoller.new(scrawler, max: args[:max].to_i)
  keywords = roller.roll(args[:keyword])
  SearchEngineScrawler::DBHelper.save_keywords(keywords)

  sites = SearchEngineScrawler::ConcurrentHelper.together(keywords) do |keyword|
    puts "Feching sites for [#{keyword}]"
    scrawler.fetch_sites(keyword)
  end

  puts sites
  SearchEngineScrawler::DBHelper.save_sites(sites)

  puts "End fetch"
end


