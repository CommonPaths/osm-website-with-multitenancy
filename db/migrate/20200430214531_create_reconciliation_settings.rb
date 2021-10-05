class CreateReconciliationSettings < ActiveRecord::Migration[6.0]
    def change
      create_table :reconciliation_settings do |t|
        t.string :setting_name
        t.string :setting_value
  
        t.timestamps
      end
    end
  end
  