module QuestionsHelper
  def render_question_help_text(question)
    return "" if question.blank?
    return "" if question.help_text.blank?
    
    content_tag :p, question.help_text, class: "muted"
  end
  
  def render_answer_items(question)
    case question.question_type_id
    when 1 
      html = '<input type="text" class="form-control">'
    when 2
      html = '<textarea class="form-control"></textarea>'
    when 3
      html = ''
      question.answers.each do |answer|
        html += "<div class=\"radio\"><label><input type=\"radio\" name=\"optionsRadios\">#{answer.content}</label></div>"
      end
    when 4
      html = ''
      question.answers.each do |answer|
        html += "<div class=\"checkbox\"><label><input type=\"checkbox\">#{answer.content}</label></div>"
      end
    when 5
      html = ''
      question.answers.each do |answer|
        html += "<option>#{answer.content}</option>"
      end
      html = "<select class=\"form-control\">#{html}</select>"
    else
      html = ''
    end
    
    raw html
    
  end
  
end