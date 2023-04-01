# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.integer :email_after_days

      t.timestamps
    end
  end
end
