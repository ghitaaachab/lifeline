class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vital_signs = VitalSign.all
  end
end
