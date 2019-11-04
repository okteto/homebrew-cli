class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://github.com/okteto/okteto/releases/latest/download/okteto-Darwin-x86_64"
    sha256 "69c816a0ca292556d3eed77396dd35dc2c00b1148dafa0697751ac29fb262f0e"
    version "1.5.3"
    
    devel do
        url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
    
    def install
        bin.install "okteto-Darwin-x86_64"
        mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        assert_match "okteto version 1.5.3", shell_output("#{bin}/okteto version 2>&1", 0)
    end
end
