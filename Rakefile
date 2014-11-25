require "bundler/gem_tasks"
require "search_engine_scrawler"


desc 'fetch sites with scrawler'
task :fetch  do
  puts "Start fetch"

  scrawler = SearchEngineScrawler::BaiduScrawler.new('www.baidu.com', 'ruby')
  scrawler.do_fetch

  puts "End fetch"
end
