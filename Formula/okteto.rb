class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.5.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7278630a542d7717d2d1fc58e98f8e04b08f197ce7bebe5b14c81c4619d26398"
    url "https://github.com/okteto/okteto/releases/download/2.5.3/okteto-Darwin-arm64"
  else
    sha256 "ccb8a6743b37a65a989c5978cf043aa22b00807e89d27ba82607382cf0c66fb6"
    url "https://github.com/okteto/okteto/releases/download/2.5.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.5.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
