class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/latest/download/okteto-Darwin-x86_64"
    sha256 "53a72ab5c94bb6d1038731fd2b02e1b54fbc839a6283c3d56d18a9bf1b6bcdfa"
    version "1.5.10"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.5.10", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
