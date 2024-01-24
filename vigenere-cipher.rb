class VigenereCipher
    attr_reader :key, :cipher_text

    def initialize(key, cipher_text)
        @key = key
        @cipher_text = cipher_text
    end
end