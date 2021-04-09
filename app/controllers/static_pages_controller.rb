require 'flickr'

class StaticPagesController < ApplicationController
  def index
    begin
      flickr = Flickr.new
      if params[:user_id].present?
        @photos = flickr.people.getPublicPhotos(user_id: params[:user_id])
      end
    rescue => e
      flash.now[:alert] = "Something went wrong, please try again"
    end
  end
end
