class UserreportsController < ApplicationController

  def download
    userreport = Prawn::Document.new
    userreport.text "Something"
    send_data(userreport.render,  filename: 'datareport.pdf', type: "application/pdf" )
  end

  def preview
    report = Prawn::Document.new
    report.text 'Line 1'
    report.text 'Line 2 Text'
    report.start_new_page
    report.text 'This Page for Photos'
    send_data(report.render,  filename: 'datareport.pdf', type: "application/pdf", disposition: "inline")
  end

end
