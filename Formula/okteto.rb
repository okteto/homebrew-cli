class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "793d66a67f8eae106d7442971841c762602951b4eca339994eed41ba205bc076"
    url "https://github.com/okteto/okteto/releases/download/1.13.4/okteto-Darwin-arm64"
  else
    sha256 "c35f917241fc4461c7576dd25bc94203ef3dfce70be75c9576d91f5025df1b6e"
    url "https://github.com/okteto/okteto/releases/download/1.13.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
