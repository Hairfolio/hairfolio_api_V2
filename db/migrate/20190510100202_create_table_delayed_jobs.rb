class CreateTableDelayedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :delayed_jobs do |t|
      t.integer :priority, :null => false
      t.integer :attempts, :null => false
      t.text  :handler, :null => false
      t.text  :last_error
      t.timestamp   :run_at
      t.timestamp   :locked_at
      t.timestamp   :failed_at
      t.string      :locked_by
      t.string      :queue
      t.timestamps
    end
  end
end
