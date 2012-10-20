# encoding: utf-8

require "dm-core"
require "dm-aggregates"
require "dm-migrations"
require "dm-validations"

logger = DataMapper::Logger.new($stdout, :debug)

db_config = YAML.load(File.read("config/database.yml"))

db_site_string = "#{db_config['adapter']}://#{db_config['username']}:#{db_config['password']}@#{db_config['hostname']}/#{db_config['database']}"
DataMapper.setup(:default, db_site_string)

# Require Models here

DataMapper.finalize
DataMapper.auto_upgrade!

