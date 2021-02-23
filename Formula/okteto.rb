class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.0"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "3bc938cf99d61f6016193d317cfc73fac705a3f21fea94cddbe7087127978fcc"
    url "https://github.com/okteto/okteto/releases/download/1.11.0/okteto-Darwin-arm64"
  else
    sha256 "4e702b0600e207cf462b2bac9abb2e31cd7806aad0ed9bc2565a537451814404"
    url "https://github.com/okteto/okteto/releases/download/1.11.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
