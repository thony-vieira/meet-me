class ActivitiesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])

    activities = Activity.where(category: @group.category)
    all_activities = Activity.all

    @users_in_group = @group.members.map(&:user)
    @markers = @users_in_group.reject { |user| user.latitude.blank? || user.longitude.blank? }.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
        # trocar a cor dos usuarios - Ler a documentação mapbox
      }
    end
    lat_sum = 0.0
    lng_sum = 0.0

    @markers.each do |marker|
      lat_sum += marker[:lat]
      lng_sum += marker[:lng]
    end
    lat_mid = lat_sum / @markers.length
    lng_mid = lng_sum / @markers.length

    mid_marker = {
      lat: lat_mid,
      lng: lng_mid
      # trocar a cor do meio da rota - Ler a documentação mapbox
    }
    @activities = activities.near([mid_marker[:lat], mid_marker[:lng]], 0)
    @mensage = ''

    if @activities.empty?
      @activities = all_activities.near([mid_marker[:lat], mid_marker[:lng]], 20) # alterar para menos KM
      @mensage = "Sorry, not found. Here are some nearby suggestions"
    end
    @message = Message.new
  end

 def show
   @activity = Activity.find(params[:id])

   @group = Group.find(params[:group_id])
   @users_in_group = @group.members.map(&:user)
   @markers = @users_in_group.reject { |user| user.latitude.blank? || user.longitude.blank? }.map do |user|
    {
      lat: user.latitude,
      lng: user.longitude
      # trocar a cor dos usuarios - Ler a documentação mapbox
    }
  end

  mid_marker = {
    lat: @activity.latitude,
    lng: @activity.longitude
    # trocar a cor do meio da rota - Ler a documentação mapbox
  }
  @markers.push(mid_marker)
  @directions = @users_in_group.reject { |user| user.latitude.blank? || user.longitude.blank? }.map do |user|
    get_direction(user.longitude, user.latitude, @activity.longitude, @activity.latitude)
  end
 end

  private

  def get_direction(start_lng, start_lat, end_lng, end_lat)
    base_url = "https://api.mapbox.com/directions/v5/"
    profile = "mapbox/driving/"
    url = "#{base_url}#{profile}#{start_lng},#{start_lat};#{end_lng},#{end_lat}?overview=full&geometries=geojson&access_token=#{ENV['MAPBOX_API_KEY']}"
    response = HTTP.get(url).body.to_s
    data = JSON.parse(response)
    coords = data["routes"][0]["geometry"]["coordinates"]
    return coords
  end
end
