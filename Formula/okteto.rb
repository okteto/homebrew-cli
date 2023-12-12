class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.23.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4ccb8a3a74fdb4c23cb5c209ffe02ccd6876d63b8c4e099e525e622d3fbb88ed"
    url "https://github.com/okteto/okteto/releases/download/2.23.1/okteto-Darwin-arm64"
  else
    sha256 "47e30e8b930613858b0c3ec590293195612b22f798b420bf1ef50e6e33aa3f13"
    url "https://github.com/okteto/okteto/releases/download/2.23.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.23.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
