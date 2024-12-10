class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.2.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "683c2c910a27b871a91dd5ede1fe6a2d8b45697bff49c11691946d2fccda4684"
    url "https://github.com/okteto/okteto/releases/download/3.2.1/okteto-Darwin-arm64"
  else
    sha256 "c7967c0ee13f12320e1d999b266afe2853aa0e5bdee9bd6c28c4f315a898e555"
    url "https://github.com/okteto/okteto/releases/download/3.2.1/okteto-Darwin-x86_64"
  end

  head do
    if Hardware::CPU.arm?
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-arm64"
    else
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "okteto-Darwin-arm64"
      mv bin/"okteto-Darwin-arm64", bin/"okteto"
    else
      bin.install "okteto-Darwin-x86_64"
      mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end
  end

  # Homebrew requires tests.
  test do
      assert_match "okteto version 3.2.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
