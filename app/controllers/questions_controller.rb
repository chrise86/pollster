class QuestionsController < ApplicationController
  before_filter :get_poll
  def edit
    @question = @poll.questions.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        redirect_to edit_url
      else
        render action: "edit"
      end
  end

  def new
    @question = @poll.questions.build
  end

  def create
     @question = @poll.questions.build(params[:question])
       if @question.save
         flash[:notice] = 'Question was successfully created.'
         redirect_to edit_url
       else
         render action: "new"
       end
   end

  def show
     @question = Question.find(params[:id])
  end

  def destroy
    @question = @poll.questions.find(params[:id])
    @question.destroy
    flash[:error] = "Your question has been deleted."
    redirect_to edit_url
  end

private

def get_poll
  @poll = Poll.find(params[:poll_id])
end

def edit_url
  "#{root_url}#{@poll.edit_slug}"
end


end