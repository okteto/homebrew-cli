class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b8d892dcc3b927047cd9a261b4c54df5fcf77dc898a2c3cb04569470693134e0"
    url "https://github.com/okteto/okteto/releases/download/2.16.4/okteto-Darwin-arm64"
  else
    sha256 "bebc022ee15b0d172679fab565413fa436ed3c94da638b87858a6d32274c5b57"
    url "https://github.com/okteto/okteto/releases/download/2.16.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
