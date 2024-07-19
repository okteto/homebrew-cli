class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.28.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "60966964f471707ab3efbaaabbd09a643e8070c70c2bd270de75621bc1b2ca11"
    url "https://github.com/okteto/okteto/releases/download/2.28.2/okteto-Darwin-arm64"
  else
    sha256 "fa46b075b7511bae42a3b9e7ed025df3769c8e3379b5fda843a06ba8c12a6214"
    url "https://github.com/okteto/okteto/releases/download/2.28.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.28.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
