class VigenereCipher
    ALPHABET = [*'A'..'Z']
    attr_reader :keyword, :cipher_text

    def initialize(keyword, cipher_text)
        @keyword = keyword.upcase
        @cipher_text = cipher_text.upcase
    end

    def plain_text
        result = []

        cipher_text.split('').each_with_index do |l, i|
            key_position = ALPHABET.index(key[i])
            cipher_position = ALPHABET.index(cipher_text[i])
            text_position = cipher_position - key_position
            result.push(ALPHABET[text_position])
        end

        result.join('')
    end

    private
    def key
        len = keyword.length
        result = keyword.split('')
        i = 0

        cipher_text.split('')[len..-1].each do
            result.push(keyword[i % len])
            i += 1
        end

        result.join('')
    end
end

# QUICK TESTS

# From example online:
cipher = VigenereCipher.new('AYUSH', 'GCYCZFMLYLEIM')
puts cipher.plain_text

# From Shopify application:
shopify_cipher = VigenereCipher.new('DEVDEGREE', 'SIMFITKXLLVOB')
puts shopify_cipher.plain_text