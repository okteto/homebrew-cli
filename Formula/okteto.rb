class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://downloads.okteto.com/cli/okteto-Darwin-x86_64"
    sha256 "257a89ee088e4a6600080ee6496583327b3346eebb02da79a465befdfb67c30f"
    version "1.1.3"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.1.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
