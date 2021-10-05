class CreateReconciliations < ActiveRecord::Migration[6.0]
    def change
      create_table :reconciliations do |t|
        t.string :node_id
        t.json :private_node_data
        t.json :public_node_data
        t.string :req_recon
        t.string :type_of_change
        t.json :private_tags
        t.json :public_tags
  
        t.timestamps
      end
    end
  end
  