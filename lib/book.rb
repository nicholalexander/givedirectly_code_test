# frozen_string_literal: true

class Book
  attr_accessor :timestamp
  attr_reader :id
  attr_reader :title

  def initialize(title:, id:, timestamp:)
    @id = id
    @timestamp = timestamp
    @title = title
  end

  def available?
    timestamp.nil?
  end

  def as_json
    {
      id: @id,
      title: @title,
      available: available?,
      timestamp: @timestamp
    }
  end
end
