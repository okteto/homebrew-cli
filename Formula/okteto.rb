class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.4/okteto-Darwin-x86_64"
    sha256 "ae80192fb352743b4ab9c626e3d4df5ca4268fc8c57bddf18aa97ff359ecadce"
    version "1.10.4"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.4", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
