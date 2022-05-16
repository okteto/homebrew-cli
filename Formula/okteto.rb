class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.3.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "c8d1bedbede22c1ad16a55be3a2b794b8f8dae328e714383eb04e833a7c00719"
    url "https://github.com/okteto/okteto/releases/download/2.3.0/okteto-Darwin-arm64"
  else
    sha256 "4f7c23829311d7c230deffa87a6be35ba7d2591a3225aee79ec938e6e0bf59a3"
    url "https://github.com/okteto/okteto/releases/download/2.3.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.3.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
