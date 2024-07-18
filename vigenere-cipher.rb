require 'minitest/autorun'

class VigenereCipher
  ALPHABET = ('A'..'Z').to_a

  attr_reader :keyword, :cipher_text

  def initialize(keyword, cipher_text)
    @keyword = keyword.upcase
    @cipher_text = cipher_text.upcase
  end

  def plain_text
    cipher_text.chars.zip(key.chars).map(&method(:decode)).join('')
  end

  private
  def key
    @key ||= begin
      factor = cipher_text.length / keyword.length + 1
      keyword * factor
    end
  end

  def decode((encoded_char, offset_char))
    encoded_position = ALPHABET.index(encoded_char)
    offset = ALPHABET.index(offset_char)
    decoded_position = encoded_position - offset
    ALPHABET[decoded_position]
  end
end

class VigenereCipherTest < Minitest::Test
  def test_working
    cipher = VigenereCipher.new('AYUSH', 'GCYCZFMLYLEIM')
    assert_equal "GEEKSFORGEEKS", cipher.plain_text

    shopify_cipher = VigenereCipher.new('DEVDEGREE', 'SIMFITKXLLVOB')
    assert_equal "PERCENTTHIRTY", shopify_cipher.plain_text
  end
end