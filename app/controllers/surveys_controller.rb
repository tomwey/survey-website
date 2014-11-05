# coding: utf-8
class SurveysController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_survey, only: [:view_form, :show, :edit, :update, :publish, :destroy]

  def index
    @surveys = Survey.all
  end

  def show
  end
  
  def view_form
    
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: '问卷创建成功!' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: '问卷修改成功!' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def publish
    @survey.published_at = Time.zone.now
    @survey.save
    redirect_to @survey, notice: "问卷发布成功!"
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :tagline, :intro, questions_attributes: [:id, :title, :help_text, :question_type_id, :is_required, :_destroy, answers_attributes: [:id,:content, :_destroy]])
    end
end
