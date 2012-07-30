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
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @poll = Poll.find_by_edit_slug(params[:edit_slug])
  end

end
