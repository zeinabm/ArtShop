class AddAutherToComments < ActiveRecord::Migration
  def change
    add_column :comments, :auther, :string
  end
end
