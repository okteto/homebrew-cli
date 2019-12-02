class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/latest/download/okteto-Darwin-x86_64"
    sha256 "e12810e36854b7e9e129c3246eaddc1ad6fa0a4653d49d8c69ff1edc44ed6b80"
    version "1.5.9"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.5.9", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
