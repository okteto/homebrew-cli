class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.12.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f5b1f4174e4de00eab16aade0db7beeba7b00bf426c535f5455b26620f08fcd4"
    url "https://github.com/okteto/okteto/releases/download/2.12.1/okteto-Darwin-arm64"
  else
    sha256 "5b48e8fb9f22d7c328ae21be9b5c949bcde11c2dce31f4f86213461c1645b54f"
    url "https://github.com/okteto/okteto/releases/download/2.12.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.12.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
