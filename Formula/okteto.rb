class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.6.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "a6edc55bfd2c4514d5ac474a3687d3fd2675bdc7b272c7e24851da91c70f0d99"
    url "https://github.com/okteto/okteto/releases/download/3.6.0/okteto-Darwin-arm64"
  else
    sha256 "0c9b1bc9579a4a7953f55fceefc63c96df92186443a3ef548519bebd8d6c8aee"
    url "https://github.com/okteto/okteto/releases/download/3.6.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.6.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
