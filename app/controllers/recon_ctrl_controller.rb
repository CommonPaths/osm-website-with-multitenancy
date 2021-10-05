class ReconCtrlController < ApplicationController
  skip_authorization_check
  skip_before_action :verify_authenticity_token


def button
    cmd_foldername = ENV["PR_IMPORT_SCRIPTS_DIR"]
    cmd_filename = '/run_reconciliation_update.sh'
    cmd = cmd_foldername + cmd_filename
    system('sh '+cmd)
    head :no_content
   end
end

