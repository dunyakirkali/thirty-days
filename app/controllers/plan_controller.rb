class PlanController < ApplicationController
  def start
    current_user.start(params[:plan])
    
    redirect_to pages_profile_path
  end
  
  def success
    current_user.mark_success
    
    redirect_to pages_profile_path
  end
  
  def fail
    current_user.mark_fail
    
    redirect_to pages_profile_path
  end
  
  def reset
    current_user.reset
    
    redirect_to pages_profile_path
  end
end
