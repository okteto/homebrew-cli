class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.10.2/okteto-Darwin-x86_64"
    sha256 "2e8bf445fccb421141509e4209c62677b7cb355a3ba3398fd3f372860aa77a63"
    version "1.10.2"
    
    head do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.10.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
