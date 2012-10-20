# encoding: utf-8

require "dm-core"
require "dm-aggregates"
require "dm-migrations"
require "dm-validations"

logger = DataMapper::Logger.new($stdout, :debug)

db_config = YAML.load(File.read("config/db_config.yml"))

db_site_string = "#{db_config['adapter']}://#{db_config['username']}:#{db_config['password']}@#{db_config['hostname']}/#{db_config['database']}"
DataMapper.setup(:default, db_site_string)

# Require Models here
require "models/user"
require "models/stop"
require "models/solution"
require "models/item_type"
require "models/item"
require "models/inventory"

DataMapper.finalize
DataMapper.auto_upgrade!

