class ActivitiesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @activities = Activity.where(category: @group.category)
    @message = Message.new
  end


 def show
   @activity = Activity.find(params[:id])
 end

end
