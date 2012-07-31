class ResponsesController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
  end

  def show
  end
end
