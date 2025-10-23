class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.12.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "2544db4ab6e3767103282653048f2434de5488eea29c91dda134a5c2ad306d60"
    url "https://github.com/okteto/okteto/releases/download/3.12.1/okteto-Darwin-arm64"
  else
    sha256 "ecd96361101030719aded402f061d9ad1e6ac964751bd841921294a71f238189"
    url "https://github.com/okteto/okteto/releases/download/3.12.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.12.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
