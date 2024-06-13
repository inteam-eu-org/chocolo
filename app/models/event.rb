class Event < ApplicationRecord
  has_and_belongs_to_many :themes

  validate :json_schema_validation

  # getters
  def kind
    properties['kind']
  end

  def texts
    properties['texts']
  end

  def texts=(texts)
    properties['texts'] = texts
  end

  def turns
    properties['turns']
  end

  def first
    properties['first']
  end

  def sips
    rand(properties['minimumSips']..properties['maximumSips'])
  end

  private

  # schema validation
  def json_schema_validation
    schema_path = Rails.root.join('config', 'schemas', 'event.json')
    schema = JSON.parse(File.read(schema_path))

    errors.add(:properties, 'is invalid') unless JSON::Validator.validate(schema, self.properties)
  end
end
