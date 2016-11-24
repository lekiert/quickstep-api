class CreateUserLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_logs do |t|
      t.references :user, foreign_key: true
      t.string :action_code
      t.jsonb :meta

      t.timestamps
    end
  end
end
