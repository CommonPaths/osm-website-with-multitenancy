class ReconciliationController < ApplicationController
  skip_authorization_check
  skip_before_action :verify_authenticity_token

  def full_report
    @data = Reconciliation.all()
    @recon_nodes = Reconciliation.where(req_recon = 'True')
    @delete_nodes = Reconciliation.where(type_of_change = 'Delete')
  end

  def create
    Reconciliation.create(node_id: params["node_id"],
      private_node_data: params["private_node_data"],
      public_node_data: params["public_node_data"],
      req_recon: params["req_manual_recon"],
      public_tags: params["public_node_tags"],
      private_tags: params["private_node_tags"],
      type_of_change: params["type_of_change"])

      render :plain => "complete"
    end

   def show
    @all_nodes = Reconciliation.order('node_id ASC').all

    render json: @all_nodes
  end

   def update  
     temp_node = params["node_id"]      
     Reconciliation.where(node_id: temp_node).update_all("private_tags=public_tags")
     head :no_content
  end

  def update_manual_update_flag
    ReconciliationSetting.where(setting_name: 'manual_update').update(setting_value:  'false')
    render :plain => "Updated"
  end

  def read_last_timestamp
    file = File.open(ENV["PR_IMPORT_PLANET_REP"]+'/last_timestamp.txt')
    @file_data = file.read
    file.close
    render :plain => @file_data
  end
end
