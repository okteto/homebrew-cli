class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.20/okteto-Darwin-x86_64"
    sha256 "fa033a7c959253fe407c7300942f69e9628e1b4d670b69f633418dbd4a0683c0"
    version "1.8.20"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.20", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
