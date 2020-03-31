class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.2/okteto-Darwin-x86_64"
    sha256 "3a6f60ecd9d80c10d066e70a0c11e56c47e911b39b0e56f8904337d9a71ba0b2"
    version "1.8.2"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.2", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
