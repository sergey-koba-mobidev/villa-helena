class BackupsController < ApplicationController
  def create
    BackupService.call
    render json: {}
  end
end