object @response_set
attribute :api_id => :uuid
attribute :created_at
attribute :completed_at
attribute :id
attribute :title
attribute :survey_description
attribute :survey_id
node(:survey_id){|rs| rs.survey.api_id }

child (@response_set.responses || []) => :responses do
  attribute :id
  attribute :survey_description
  attribute :title
  attribute :survey_id
  attribute :api_id => :uuid
  attribute :created_at
  attribute :updated_at => :modified_at
  attribute :response_group
  node(:answer_id){|r| r.answer.api_id }
  node(:question_id){|r| r.question.api_id }
  node(:value, :if => lambda{|r| r.answer.response_class != "answer"}){|r| r.json_value }
end
