class PlanController < ApplicationController
  def start
    current_user.start(params[:plan])
    
    redirect_to root_path
  end
  
  def success
    current_user.mark_success
    
    redirect_to root_path
  end
  
  def fail
    current_user.mark_fail
    
    redirect_to root_path
  end
  
  def reset
    current_user.reset
    
    redirect_to root_path
  end
end
