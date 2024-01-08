class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.24.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "845f698e61565d492036eccc26224b01195cb0a67e042643e5d1dd7778c0d67f"
    url "https://github.com/okteto/okteto/releases/download/2.24.0/okteto-Darwin-arm64"
  else
    sha256 "18293869789812ba681f7591b41d73244442c54accac3f6d4007f036f1f4be39"
    url "https://github.com/okteto/okteto/releases/download/2.24.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.24.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
