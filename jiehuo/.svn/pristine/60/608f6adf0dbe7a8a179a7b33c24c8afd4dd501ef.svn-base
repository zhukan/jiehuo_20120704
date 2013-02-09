class Sha1CryptoMethod
  def self.encrypt(*tokens)
    tokens = tokens.flatten
    password = tokens.shift
    salt = tokens.shift
    if salt!=nil
      password = salt+password
    end
    Digest::SHA1.hexdigest(password)
  end

  def self.matches?(crypted, *tokens)
    encrypt(*tokens) == crypted

  end
end
