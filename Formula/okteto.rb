class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.29.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7c4cfafd09cff401af5b1faf34f7532e1b5ec09653a09b8f05c12c55b0dc5bd0"
    url "https://github.com/okteto/okteto/releases/download/2.29.1/okteto-Darwin-arm64"
  else
    sha256 "da81a5f2e203d20f42b161f20a03d72f94a409ce6ad0c2df5d9c283be06df70f"
    url "https://github.com/okteto/okteto/releases/download/2.29.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.29.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
