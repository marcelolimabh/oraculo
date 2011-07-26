class QuestionsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.paginate :page => params[:page], :per_page => 10, :order => "created_at desc"

    respond_with(@questions)
  end

  def show
    @question = Question.find(params[:id])
    respond_with(@question)
  end

  def new
    @question = current_user.questions.build
    respond_with(@question)
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.new(params[:question])
    @question.save
    respond_with(@question)
  end

  def update
    @question = current_user.questions.find(params[:id])
    @question.update_attributes(params[:question])
    respond_with(@question)
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    respond_with(@question)
  end
end

