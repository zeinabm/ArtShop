class AddPasswordDigestToSellers < ActiveRecord::Migration
  def up
    remove_column "sellers", "hashed_password"
    add_column "sellers", "password_digest", :string
  end

  def down
    add_column "sellers", "hashed_password", :string
    remove_column "sellers", "password_digest"
  end
end
