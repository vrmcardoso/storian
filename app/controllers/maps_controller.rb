class MapsController < ApplicationController

  private

  def map_params
    params.require(:map).permit(:name, :world_id, :image)
  end
end
