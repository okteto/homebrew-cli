class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.10"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e044d4529c6ac0eebbeeaa260b7e77aa825383f442a88538a784da53ef12457e"
    url "https://github.com/okteto/okteto/releases/download/1.14.10/okteto-Darwin-arm64"
  else
    sha256 "9a46dae2354d7dfd47dcde8eb45c90d6d08f7d97fd568fc92f87278e822c0d74"
    url "https://github.com/okteto/okteto/releases/download/1.14.10/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.10", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
