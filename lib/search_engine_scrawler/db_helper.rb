require 'active_record'

module SearchEngineScrawler

  # Use sqlite3
  # DB_CONFIG = {
  #    adapter: 'sqlite3', database: 'scrawler.db'
  # }

  DB_CONFIG = {
      adapter:  'mysql2',
      host:     'localhost',
      username: 'root',
      encoding: 'utf8',
      password: 'lingceng',
      database: 'scrawler'
  }

  class Keyword < ActiveRecord::Base
    establish_connection DB_CONFIG
    # connection.create_database 'scrawler', charset: 'utf8'

    unless Keyword.table_exists?
      connection.create_table table_name, force: true do |t|
        t.string :name
        t.integer :position
      end
    end

  end

  class Site < ActiveRecord::Base
    establish_connection DB_CONFIG

    unless Site.table_exists?
      connection.create_table table_name, force: true do |t|
        t.string :title
        t.text :link
        t.integer :position
      end
    end

  end

  module DBHelper
    module_function

    def save_keywords(keywords)
      keywords.each_with_index do |keyword, index|
        Keyword.create!(name: keyword, position: index)
      end
    end

    def save_sites(sites)
      sites.each_with_index do |site, index|
        Site.create!(title: site[1], link: site[0], position: index)
      end
    end

  end

end

