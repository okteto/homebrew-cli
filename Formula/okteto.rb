class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.30.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "c1bac02a4426295555c62049bca3ece5ee44a6f643798e66f460fa13fd0c8ec1"
    url "https://github.com/okteto/okteto/releases/download/2.30.0/okteto-Darwin-arm64"
  else
    sha256 "1b9fe2bc8fa76a2da92b4d47f5741db3389f1c5fd8ab66ccb38c374e12b394ab"
    url "https://github.com/okteto/okteto/releases/download/2.30.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.30.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
