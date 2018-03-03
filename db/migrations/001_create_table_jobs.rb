class CreateTableJobs < Sequel::Migration
  def up
    create_table :jobs do
      primary_key :id
      column :title, :text
      index :title
    end

    puts ' ==> created table jobs'
  end

  def down
    drop_table :jobs
  end
end
