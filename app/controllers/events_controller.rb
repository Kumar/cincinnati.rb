class EventsController < ApplicationController
  def new
    unless User.authenticate(params[:user], params[:password])
      render :status => :unauthorized
    end
  end
  
  def create
    unless User.authenticate(params[:user], params[:password])
      render :status => :forbidden
      return
    end
    Event.create! params[:event]
  end
end