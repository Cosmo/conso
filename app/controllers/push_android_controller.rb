class PushAndroidController < ApplicationController
  def create
    AndroidDevice.create(token: params[:id])
    head :no_content
  end
end