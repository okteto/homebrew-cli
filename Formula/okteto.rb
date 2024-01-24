class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.24.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4b96f366496b87bb2977ad069c12ad30a8cd1614b768a339b7a11abe378fe049"
    url "https://github.com/okteto/okteto/releases/download/2.24.2/okteto-Darwin-arm64"
  else
    sha256 "9cec0ded1da9f3f4d9158a394d508fa15754e0f5313962b7f1dc5933ea8f571b"
    url "https://github.com/okteto/okteto/releases/download/2.24.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.24.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
