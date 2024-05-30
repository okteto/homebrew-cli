class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.27.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d71d1538e835f84af047b39d25a7590c4f0ef39fa11d34e70f9b6b49c9982535"
    url "https://github.com/okteto/okteto/releases/download/2.27.4/okteto-Darwin-arm64"
  else
    sha256 "aef68ea7edbbd5cc5178d2470b8a70d47beb525869b278d6501ad91c56f683dc"
    url "https://github.com/okteto/okteto/releases/download/2.27.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.27.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
