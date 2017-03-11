class SurveysController < ApplicationController
  before_action :find_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.author = current_user

    if @survey.save
      flash[:success] = "Survey successfully created."
      redirect_to surveys_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @survey.update(survey_params)
      flash[:success] = "Survey successfully updated."
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def destroy
    if @survey.destroy
      flash[:success] = "Survey, questions, and answers successfully deleted."
      redirect_to surveys_path
    else
      render :edit
    end
  end

private

  def find_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description, :active)
  end
end
