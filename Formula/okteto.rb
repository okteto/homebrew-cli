class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "98579f669ec517b46d93822d6b974357e368cbd356e8920d36c55fd676dcc1b2"
    url "https://github.com/okteto/okteto/releases/download/1.14.5/okteto-Darwin-arm64"
  else
    sha256 "23b6621fce26c177735ca436cfc052b5ffaeacc1fae5a3364a9cc488c16feb96"
    url "https://github.com/okteto/okteto/releases/download/1.14.5/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.5", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
