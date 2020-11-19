class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.9.6/okteto-Darwin-x86_64"
    sha256 "19efcc8660acd59c3d08696b09e51c3168b3c37d3052c518aea27efd871a1691"
    version "1.9.6"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.9.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
