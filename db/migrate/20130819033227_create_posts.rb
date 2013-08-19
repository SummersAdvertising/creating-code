class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :status
      t.text :response
      t.integer :response_user_id
      t.timestamp :response_time

      t.timestamps
    end
  end
end
