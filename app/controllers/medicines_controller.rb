class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.all
    @new_medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @medicine.user = current_user

    if @medicine.save!
      redirect_to medicines_path, notice: "Medicine added successfully."
    else
      flash.now[:alert] = "Failed to add medicine."
      @medicines = Medicine.all
      render :index
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy

    respond_to do |format|
      format.html { redirect_to medicines_path, notice: "Medicine deleted successfully." }
      format.js   #
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :start_date, :end_date, :notes)
  end
end
