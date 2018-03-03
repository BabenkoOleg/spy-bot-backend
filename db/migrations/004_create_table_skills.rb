class CreateTableSkills < Sequel::Migration
  def up
    create_table :skills do
      primary_key :id
      String :title
      index :title
    end
  end

  def down
    drop_table :skills
  end
end
