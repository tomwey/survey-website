json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :tagline
  json.url survey_url(survey, format: :json)
end
