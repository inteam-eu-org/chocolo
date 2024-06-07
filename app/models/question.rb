class Question < ApplicationRecord
  has_and_belongs_to_many :themes

  validate :json_schema_validation

  def build
    case kind
    when 'simple'
      if primary.include? '{sips}'
        primary.gsub('{sips}', sips.to_s)
      else
        primary
      end
    when 'effect'
      raise NotImplementedError
    end
  end

  private
  # getters
  def kind
    properties['kind']
  end

  def primary
    properties['primaryText']
  end

  def secondary
    properties['secondaryText']
  end

  def turns
    properties['turns']
  end

  def protagonists
    properties['protagonists']
  end

  def sips
    properties['sips']
  end

  # schema validation
  def json_schema_validation
    schema_path = Rails.root.join('config', 'schemas', 'question.json')
    schema = JSON.parse(File.read(schema_path))

    errors.add(:properties, 'is invalid') unless JSON::Validator.validate(schema, self.properties)
  end
end
