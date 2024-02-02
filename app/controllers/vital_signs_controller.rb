class VitalSignsController < ApplicationController
  def index
  end

  def new
    @vital_sign = VitalSign.new
    @vital_signs = VitalSign.all
  end

  def create
    vital_sign = VitalSign.new(vital_sign_params)
    vital_sign.user_id = current_user.id


    if vital_sign.save!
      redirect_to vital_signs_new_path, notice: 'Vital sign added successfully.'
    else
      render :new
    end
  end

  private

  def vital_sign_params
    params.require(:vital_sign).permit(:label, :value)
  end
end
