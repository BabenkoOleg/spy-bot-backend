class CreateTableSubategories < Sequel::Migration
  def up
    create_table :subcategories do
      primary_key :id
      foreign_key :category_id, :categories
      String :upwork_id
      String :title
    end
  end

  def down
    drop_table :subcategories
  end
end
