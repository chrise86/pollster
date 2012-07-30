class QuestionsController < ApplicationController
  before_filter :get_poll
  def edit
    @question = @poll.questions.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update_attributes(params[:question])
        redirect_to poll_path (@question.poll), notice: 'Question was successfully updated.'
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
         redirect_to poll_path (@question.poll), notice: 'Question was successfully created.'
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
    redirect_to poll_path(params[:poll_id])
  end

private

def get_poll
  @poll = Poll.find(params[:poll_id])
end


end