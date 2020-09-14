class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.22/okteto-Darwin-x86_64"
    sha256 "61fd7f05d82ab3f12917a3ddc79a8516517b3af88d3a45ce07ee99379321555b"
    version "1.8.22"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.22", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
