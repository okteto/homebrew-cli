class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/okteto-Darwin-x86_64"
    sha256 "1bc072319b564020a63966b6ccc820a78f96e2ef4efd5a7b1a54abef22e39d40"
    version "1.2.1"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.2.1", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
