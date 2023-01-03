class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.11.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5d69a1c0cc42ab582c69ec0bf29a27f47f8fbc3d1a46ef36bf5891e96a86c683"
    url "https://github.com/okteto/okteto/releases/download/2.11.0/okteto-Darwin-arm64"
  else
    sha256 "5f8a8291930e7f9b6a88bc29ee3f1b2fff64e544f5ee33543bd230390d201c93"
    url "https://github.com/okteto/okteto/releases/download/2.11.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.11.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
