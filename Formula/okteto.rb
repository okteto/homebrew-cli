class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.10.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4c5b576155ed92bc038ce1f964f33dc05fde26e301383bcaf3b2e6c0007bc36f"
    url "https://github.com/okteto/okteto/releases/download/2.10.0/okteto-Darwin-arm64"
  else
    sha256 "ccb1019c6276d857f7bd388ef9bcb0756c5068ecadb72608228efa877ce73e74"
    url "https://github.com/okteto/okteto/releases/download/2.10.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.10.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
