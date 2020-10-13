class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.9.2/okteto-Darwin-x86_64"
    sha256 "771b2a9f1ba253c0fcdb9dfeb086db061085974d825f06895ccfb3704699813d"
    version "1.9.2"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.9.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
