class ChangeKarmaPointsToKarmaTotal < ActiveRecord::Migration
  def change
    rename_column :users, :karma_points, :karma_total
  end
end
