class Event < ApplicationRecord
  has_and_belongs_to_many :themes

  validate :json_schema_validation

  # Return a list sentences
  def build
    case kind
    when 'statement'
      texts.map do |t|
        text = t
        puts text
        if text.include? '{sips}'
          text = text.gsub('{sips}', sips.to_s)
        end
        # TODO
        # if text.include? '{player_X}' # use regex here
        #   ...
        # end
        text
      end
    else
      raise NotImplementedError
    end
  end

  private
  # getters
  def kind
    properties['kind']
  end

  def texts
    properties['texts']
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
    schema_path = Rails.root.join('config', 'schemas', 'event.json')
    schema = JSON.parse(File.read(schema_path))

    errors.add(:properties, 'is invalid') unless JSON::Validator.validate(schema, self.properties)
  end
end
