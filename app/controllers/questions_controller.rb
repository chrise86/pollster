class QuestionsController < ApplicationController
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update_attributes(params[:question])
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render action: "edit"
      end
  end

  def new
    @question = Question.new
  end

  def create
     @question = Question.new(params[:question])
       if @question.save
         redirect_to @question, notice: 'Question was successfully created.'
       else
         render action: "new"
       end
   end

  def show
     @question = Question.find(params[:id])
  end
end
