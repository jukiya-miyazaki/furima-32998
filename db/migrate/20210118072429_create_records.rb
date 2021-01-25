class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|

      t.references  :user,             foreign_key: true
      # 外部キー
      t.references  :item,             foreign_key: true
      # 外部キー
      t.timestamps
    end
  end
end
