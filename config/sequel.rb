DATA_BASE = Sequel.connect({
  database: ENV['sequel_database'],
  adapter: ENV['sequel_adapter'],
  user: ENV['sequel_user'],
  password: ENV['sequel_password'],
  host: ENV['sequel_host'],
  port: ENV['sequel_port'],
  max_connections: ENV['sequel_max_connections'],
  logger: Logger.new(ENV['sequel_log_file_path'])
})

DATA_BASE.create_table? :jobs do
  primary_key :id
  String :category
  String :subcategy
  String :skills
  String :url
  String :upwork_id
  String :title
  String :snippet
  String :job_type
  String :duration
  String :workload
  String :job_status
  Integer :budget
  column :created_at, 'timestamp with time zone'
  index :upwork_id
end
