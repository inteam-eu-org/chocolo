class Question < ApplicationRecord
  has_and_belongs_to_many :themes

  validate :json_schema_validation

  private

  def json_schema_validation
    schema_path = Rails.root.join('config', 'schemas', 'question.json')
    schema = JSON.parse(File.read(schema_path))

    errors.add(:properties, 'is invalid') unless JSON::Validator.validate(schema, self.properties)
  end
end
