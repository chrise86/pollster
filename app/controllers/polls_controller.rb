class PollsController < ApplicationController

  def index
    @polls = Poll.all
    @question = Question.new
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      ## move link to model?
      link = "<a href=\"#{root_url}#{@poll.edit_slug}\">#{root_url}#{@poll.edit_slug}</a>"
      flash[:notice] = "Poll was successfully created. Save this url to edit your poll or add questions: #{link}".html_safe
      redirect_to "#{root_url}#{@poll.edit_slug}"
    else
      render action: "new"
    end
  end

  def edit
    @poll = Poll.find_by_edit_slug(params[:edit_slug])
  end

  def update
    @poll = Poll.find(params[:id])
      if @poll.update_attributes(params[:poll])
        flash[:notice] =  'Poll was successfully updated.'
        redirect_to @poll
      else
        render action: "edit"
      end
  end

end
