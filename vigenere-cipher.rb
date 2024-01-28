class VigenereCipher
    ALPHABET = [*'A'..'Z']
    attr_reader :keyword, :cipher_text, :key

    def initialize(keyword, cipher_text)
        @keyword = keyword.upcase
        @cipher_text = cipher_text.upcase
    end

    def plain_text
        cipher_text.split('').each_with_index.map do |l, i|
            key_position = ALPHABET.index(key[i])
            cipher_position = ALPHABET.index(cipher_text[i])
            text_position = cipher_position - key_position
            ALPHABET[text_position]
        end.join('')
    end

    private
    def key
        keyword_length = keyword.length
        result = keyword.split('')
        i = 0

        (cipher_text.length - keyword_length).times do
            result.push(keyword[i % keyword_length])
            i += 1
        end

        @key = result.join('')
    end
end

# QUICK TESTS

# From example online:
cipher = VigenereCipher.new('AYUSH', 'GCYCZFMLYLEIM')
puts cipher.plain_text

# From Shopify application:
shopify_cipher = VigenereCipher.new('DEVDEGREE', 'SIMFITKXLLVOB')
puts shopify_cipher.plain_text