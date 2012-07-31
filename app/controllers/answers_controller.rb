class AnswersController < ApplicationController
  before_filter :get_question
  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      redirect_to poll_path (@question.poll), notice: 'Answer was successfully created.'
    else
      render action: "new"
    end
  end

private

  def get_question
    @question = Question.find(params[:question_id])
  end

end


  def show
     @question = Question.find(params[:id])
  end
