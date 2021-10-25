class AddUserToWords < ActiveRecord::Migration[6.1]
  def change
    add_reference :words, :user, index: true, foreign_key: true
  end
end