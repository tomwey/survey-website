module SurveysHelper
  def render_survey_intro(survey)
    return "" if survey.blank?
    return "" if survey.intro.blank?
    
    content_tag :p, survey.intro, class: 'muted'
  end
end
