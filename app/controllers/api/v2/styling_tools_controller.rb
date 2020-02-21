class Api::V2::StylingToolsController < ApplicationController
  before_action :authenticate_with_token!, except: [:index]

  def index
    success(data: StylingTool.all, status: 200)
  end
end

