class SymptomsController < ApplicationController
  def index
    @symptoms = Symptom.all
    @new_symptom = Symptom.new
  end

  def create
    @symptom = current_user.symptoms.build(symptom_params)

    if @symptom.save
      redirect_to symptoms_path, notice: "Symptom added successfully."
    else
      flash.now[:alert] = "Failed to add symptom."
      @symptoms = Symptom.all
      render :index
    end
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy

    respond_to do |format|
      format.html { redirect_to symptoms_path, notice: "Symptom deleted successfully." }
      format.js
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:description, :start_date, :end_date)
  end
end
