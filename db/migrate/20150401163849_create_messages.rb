class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :blog, index: true
      t.references :user, index: true
      t.text :message

      t.timestamps
    end
  end
end
