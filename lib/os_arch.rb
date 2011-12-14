class OSArch
  class << self
    def windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def osx?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def linux?
      !osx? && !windows?
    end
  end
end
