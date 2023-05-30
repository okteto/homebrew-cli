class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "56c29c876cae26430a65bb7cde1e34a98340a109c1c669704bd0907b9190a3c7"
    url "https://github.com/okteto/okteto/releases/download/2.16.1/okteto-Darwin-arm64"
  else
    sha256 "eaf59bf837d861e1b3b9845c3754aca4851f7b507fbeeabb11d12b3c46573c0e"
    url "https://github.com/okteto/okteto/releases/download/2.16.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
