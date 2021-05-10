class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.11"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "8349b3a24f983e4218c6058261d996239077854e4ef4d636de3f305369cb6d5d"
    url "https://github.com/okteto/okteto/releases/download/1.12.11/okteto-Darwin-arm64"
  else
    sha256 "9661fcd21cf4615089d789f81519f3694d00f68d85c1111219379d7373424fa6"
    url "https://github.com/okteto/okteto/releases/download/1.12.11/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.11", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
