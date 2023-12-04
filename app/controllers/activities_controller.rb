class ActivitiesController < ApplicationController

  def index
    group = Group.find(params[:group_id])
    @activities = Activity.where(category: group.category)
  end


 def show
   @activity = Activity.find(params[:id])
 end

end
