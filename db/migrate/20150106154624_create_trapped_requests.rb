class CreateTrappedRequests < ActiveRecord::Migration
  def change
    create_table :trapped_requests do |t|
      t.string :trap_id
      t.string :params
      t.string :referrer
      t.string :http_method
      t.string :remote_ip
      t.string :scheme
      t.string :headers

      t.timestamps null: false
    end
  end
end
