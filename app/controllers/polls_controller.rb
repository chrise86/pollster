class PollsController < ApplicationController
  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      link = "<a href=\"#{root_url}#{@poll.edit_slug}\">#{root_url}#{@poll.edit_slug}</a>"
      redirect_to @poll, notice: "Poll was successfully created. Your special editing link is: #{link}".html_safe
    else
      render action: "new"
    end
  end

  def edit
    @poll = Poll.find_by_edit_slug(params[:edit_slug])
  end

end
