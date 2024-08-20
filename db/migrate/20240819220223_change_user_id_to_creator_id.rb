class ChangeUserIdToCreatorId < ActiveRecord::Migration[7.1]
  def up
    change_table :events do |t|
      t.rename :user_id, :creator_id
    end
  end
  def down
    change_table :events do |t|
      t.rename :creator_id, :user_id
    end
  end
end
