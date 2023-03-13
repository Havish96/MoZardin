class AddListIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :list, foreign_key: true
  end
end
