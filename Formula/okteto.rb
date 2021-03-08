class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.2"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "225d4ff9695ef47b47f8c86c10ed1a2ef711da3fd16d3a548beb42ebeac2f495"
    url "https://github.com/okteto/okteto/releases/download/1.11.2/okteto-Darwin-arm64"
  else
    sha256 "7152355cf020d9a3ed50e6b86e6014cefff21020fc72c82e8c8b68d412af8dec"
    url "https://github.com/okteto/okteto/releases/download/1.11.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
