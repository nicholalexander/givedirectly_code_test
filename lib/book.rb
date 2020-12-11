# frozen_string_literal: true

class Book
  attr_accessor :timestamp
  attr_writer :available
  attr_reader :id
  attr_reader :title

  def initialize(title:, id:, timestamp:, available:)
    @id = id
    @timestamp = timestamp
    @title = title
    @available = available
  end

  def available?
    @available
  end

  def set_timestamp
    @timestamp = Time.now
  end


  def set_to_unavailable
    @available = false
  end

  def as_json
    {
      id: @id,
      title: @title,
      available: available?,
      timestamp: @timestamp
    }
  end

  def to_h
    {
      title: @title, 
      timestamp: @timestamp, 
      available: available?
    }
  end

end
