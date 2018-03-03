config = { logger: Logger.new(ENV['sequel_log_file_path']) }
options = [:database, :adapter, :user, :password, :host, :port, :max_connections]
options.each { |key| config[key] = ENV["sequel_#{key}"] }

DB = Sequel.connect(config)
Sequel.extension :migration
Sequel::Migrator.run(DB, './db/migrations')
