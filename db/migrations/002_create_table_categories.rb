class CreateTableCategories < Sequel::Migration
  def up
    create_table :categories do
      primary_key :id
      String :upwork_id
      String :title
    end
  end

  def down
    drop_table :categories
  end
end
