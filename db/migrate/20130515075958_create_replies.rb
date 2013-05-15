class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
