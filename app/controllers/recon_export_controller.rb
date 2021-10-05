class ReconExportController < ApplicationController
    require 'open3'
    skip_authorization_check
    skip_before_action :verify_authenticity_token
  
    def recon_export_page
    end
  
    def download_osc
     button_export
     now_date_time = Time.now.strftime("%F_%H_%M")
     filename_download = "recon_public_export_" + now_date_time + ".osc"
     send_file(
      "#{Rails.root}/public/recon_public_export.osc",
      filename: filename_download,
      type: "application/pdf"
     )
     @formstring = '.'
    end
  
    def button_export
      cmd_foldername = ENV["PR_IMPORT_SCRIPTS_DIR"]
      if cmd_foldername.nil? || cmd_foldername.empty?
        cmd_foldername = '/home/ubuntu/pr_import/scripts'
      end
       cmd_filename = '/export_recon_changeset.sh'
      cmd = cmd_foldername + cmd_filename
      script_out_err = ''
      @formstring = 'Processing ...'
      Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
      script_out_err = stdout_err.read + script_out_err
      status_code = wait_thr.value
      status_value = "Export Script Run Success = " + (status_code.success?).to_s
      puts script_out_err + status_value
      @formstring = script_out_err + status_value
      end
    end  
  end
  