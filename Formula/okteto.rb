class Okteto < Formula
    desc "CLI for cloud native development"
    homepage "https://okteto.com"
    url "https://s3-us-west-1.amazonaws.com/okteto-cli/0.1.0/okteto-darwin-amd64"
    sha256 "d17295f0ef88f3d0e6792a48cfd1bf48a74e9d5f60fae2d7ca311ec55c8a59a8"
    version "0.1.0"
    depends_on "syncthing"

    def install
        bin.install "okteto-darwin-amd64"
        mv bin/"okteto-darwin-amd64", bin/"okteto"
    end

    # Homebrew requires tests.
    test do
        shell_output("#{bin}/okteto", 0)
    end
end
