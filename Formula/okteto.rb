class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.8.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ac7a30858c5d22b24322cfc956ed1b1bbf5f9f2cdfa4e5455c8c725f93cf444b"
    url "https://github.com/okteto/okteto/releases/download/2.8.2/okteto-Darwin-arm64"
  else
    sha256 "21e6f0ffb97665b9e6a4224cf5da4ec97f2a2555cf592800aa8667156bc46b45"
    url "https://github.com/okteto/okteto/releases/download/2.8.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.8.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
