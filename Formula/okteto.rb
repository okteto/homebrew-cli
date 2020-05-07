class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/download/1.8.6/okteto-Darwin-x86_64"
    sha256 "248eabb67363f41da0d6f3caf061d95bf7f6ba7a07027225fc8c7f7b41e34be6"
    version "1.8.6"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.8.6", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
