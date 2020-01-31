class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/latest/download/okteto-Darwin-x86_64"
    sha256 "97f0c0153e21a831fd890df71f9dcc773b4cf5e07e3108b314a530fced36a102"
    version "1.7.0"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.7.0", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
