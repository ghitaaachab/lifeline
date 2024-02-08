class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @new_appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: "Appointment added successfully."
    else
      flash.now[:alert] = "Failed to add appointment."
      @appointments = Appointment.all
      render :index
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_path, notice: "Appointment deleted successfully." }
      format.js
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_name, :reminder)
  end
end
