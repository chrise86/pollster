class ResponsesController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
  end

  def create
    params.each_pair do |k,v|
      if k.include? "answer"
        Answer.create(:question_id => k.split("-")[1], :text => v)
      end
    end
    redirect_to poll_path(params[:poll_id])
  end

  def show
  end

end
