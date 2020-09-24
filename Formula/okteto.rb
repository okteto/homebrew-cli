class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.9.0/okteto-Darwin-x86_64"
    sha256 "6802b90ab4304b47233822ef84ba420bbecbe73fb0cae3824a537a3d225be6da"
    version "1.9.0"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.9.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
