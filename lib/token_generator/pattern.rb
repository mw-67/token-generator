class TokenGenerator
  class Pattern
    attr_reader :segments, :segment_size, :seperator

    def initialize(segments:, segment_size:, seperator:)
      @segments = segments
      @segment_size = segment_size
      @seperator = seperator
    end

    def to_s
      ([LETTER_PLACEHOLDER * segment_size] * segments).join(seperator)
    end
  end
end
