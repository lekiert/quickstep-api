class AddOverallScoreToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :overall_score, :integer, default: 0
  end
end
