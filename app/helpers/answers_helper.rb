module AnswersHelper
  def render_answer_item(answer)
    return "" if answer.blank?
    return "" if answer.question.blank?
    
    type_id = answer.question.question_type_id
    if type_id == 1 or type_id == 2
      if answer.content.blank?
        return ""
      end
    end
    
    case type_id
    when 1 then html = '<input type="text" class="form-control">'
    when 2 then html = '<textarea class="form-control"></textarea>'
    when 3 then raw %(<div class="radio">
                        <label>
                          <input type="radio" name="optionsRadios">
                          <%= answer.content %>
                        </label>
                      </div>)
                    when 4 then raw %(  <div class="checkbox">
    <label>
      <input type="checkbox"> <%= answer.content %>
    </label>
  </div>)
    when 5 then raw %(<select class="form-control">
                        <option><%= answer.content %></option></select>)
                      else ""
                      end
    
  end
end