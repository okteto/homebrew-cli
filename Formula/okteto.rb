class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/okteto-Darwin-x86_64"
    sha256 "e9383d96371185a35b45d0045cf9432cb84132401b968aa3c180ed18a7631b9b"
    version "1.4.1"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.4.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
