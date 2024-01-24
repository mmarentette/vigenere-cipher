class VigenereCipher
    attr_reader :keyword, :cipher_text

    def initialize(keyword, cipher_text)
        @keyword = keyword.upcase
        @cipher_text = cipher_text.upcase
    end

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

cipher = VigenereCipher.new('AYUSH', 'GCYCZFMLYLEIM')
print cipher.key