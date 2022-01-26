class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "39bd8083e171af79fe4bb07860295dc383e05d18ef083eb5208adf79669f29b6"
    url "https://github.com/okteto/okteto/releases/download/1.15.2/okteto-Darwin-arm64"
  else
    sha256 "4dadf96db0f6be359981a33d5e5087267fa0905464b36ea44b3086ef986ec138"
    url "https://github.com/okteto/okteto/releases/download/1.15.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
