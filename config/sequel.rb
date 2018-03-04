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
  column :title, :text
  index :title
end

DATA_BASE.create_table? :categories do
  primary_key :id
  String :upwork_id
  String :title
end

DATA_BASE.create_table? :subcategories do
  primary_key :id
  foreign_key :category_id, :categories
  String :upwork_id
  String :title
end

DATA_BASE.create_table? :skills do
  primary_key :id
  String :title
  index :title
end

DATA_BASE.create_table? :observations do
  primary_key :id
  String :q
  String :title
  String :skills
  String :category
  String :subcategory
  String :job_type
  index :title
end
