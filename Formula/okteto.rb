class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.19.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ed830f1a579a48146c4abfd2fb0118ea6279a8cbe35fa53c886fa0afd90dfdbc"
    url "https://github.com/okteto/okteto/releases/download/2.19.2/okteto-Darwin-arm64"
  else
    sha256 "6c603a77a2ee5d4171d9770475e7b6ac703f74308fad3c2add93b5b9491e5970"
    url "https://github.com/okteto/okteto/releases/download/2.19.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.19.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
