class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.11.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e098d39e8e51a2e083833472e93b9c3bb6e90380baabf0b16431b88de06b273a"
    url "https://github.com/okteto/okteto/releases/download/3.11.0/okteto-Darwin-arm64"
  else
    sha256 "241d6cd129f99dd73e57855c03f1d6b1fb6640ac45901c7b8ca83a7e47607098"
    url "https://github.com/okteto/okteto/releases/download/3.11.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.11.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
