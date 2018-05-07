class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.boolean :daily
      t.boolean :article

      t.timestamps
    end
  end
end
