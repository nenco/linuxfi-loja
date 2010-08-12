
require 'yaml'

RAILS_ENV = ENV['RAILS_ENV'] || 'development'
RAILS_ROOT = File.expand_path( File.join( File.dirname( __FILE__ ), '..', '..' ) )

namespace :solr do

  def sunspot_config
    @options ||= YAML.load_file( "#{RAILS_ROOT}/config/sunspot.yml" )
    raise "There is no configuration for rails env #{RAILS_ENV} - #{@options.inspect}" if @options[RAILS_ENV].nil?
    @options[RAILS_ENV]
  end

  def solr_command( kind )
    command = "sunspot-solr #{kind} -d #{RAILS_ROOT}/config/solr/data/#{RAILS_ENV} -s #{RAILS_ROOT}/config/solr -p #{sunspot_config['solr']['port']}"
    puts "Running command:"
    puts command
    system( command )
  end

  desc 'Starts the solr process'
  task :start do
    solr_command('start')
  end

  desc 'Stops the solr process'
  task :stop do
    solr_command('stop')
  end

  desc 'Cleans up solr data directlry'
  task :clean => :stop do
    system( "rm -rf #{RAILS_ROOT}/config/solr/data/#{RAILS_ENV}" )
  end

  desc 'Restart the solr server'
  task :restart => [ :clean, :start ]

end
