class UserreportsController < ApplicationController
  # def index
  #   generate_qrcode
  # end

  # def qr_code_generator; end

  # def qr_code_download
  #   send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  # end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "dashboards/index.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

end
