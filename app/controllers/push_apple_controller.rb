class PushAppleController < ApplicationController
  def create
    AppleDevice.create(token: params[:id])
    head :no_content
  end
end