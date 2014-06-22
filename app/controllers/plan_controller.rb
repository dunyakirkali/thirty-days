class PlanController < ApplicationController
  def start
    current_user.update_attribute(:plan, params[:plan])
    
    redirect_to pages_profile_path, notice: 'Plan Saved'
  end
end
