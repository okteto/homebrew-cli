class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7f76cca2348c66874bc0182540528204a673ad550677327125a3171a95bfbf74"
    url "https://github.com/okteto/okteto/releases/download/1.13.5/okteto-Darwin-arm64"
  else
    sha256 "b8660fcc7d28c5bd4e1e4cc8d8da0d15d6622156b3d72d856de03e3b3d39e08f"
    url "https://github.com/okteto/okteto/releases/download/1.13.5/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.5", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
