require 'token_generator/version'
require 'token_generator/pattern'
require 'securerandom'

class TokenGenerator
  attr_reader :pattern

  LETTER_PLACEHOLDER = 'c'.freeze

  def initialize(pattern, random = SecureRandom)
    @pattern = pattern.to_s
    @random = random
    check_pattern
  end

  def token
    pattern.dup.gsub(LETTER_PLACEHOLDER) { |_m| random_char }
  end

  private

  def check_pattern
    message = 'invalid pattern. lower case characters are reserved'
    raise ArgumentError, message unless pattern =~ /^([^a-z]|c)*$/
  end

  def random_char
    (65 + @random.random_number(26)).chr
  end
end
