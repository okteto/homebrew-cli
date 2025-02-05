class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.4.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f5725b8d90738ef4bbd6ebd1adb11b9d92f9f749867f8244aad7254e1e2d3c93"
    url "https://github.com/okteto/okteto/releases/download/3.4.0/okteto-Darwin-arm64"
  else
    sha256 "472a25a725a079a33bb008f8c7617c965cd892c4528e8a26a7d8e4bbacefabe3"
    url "https://github.com/okteto/okteto/releases/download/3.4.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.4.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
