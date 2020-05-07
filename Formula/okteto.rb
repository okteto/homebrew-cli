class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.8/okteto-Darwin-x86_64"
    sha256 "835392211d95a812411f65ca06ae50a1b1a63e6d280799c55f25bee46f11c25d"
    version "1.8.8"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.8", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
