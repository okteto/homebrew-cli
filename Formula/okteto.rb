class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.9"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "da110a9f7ab3f088ac9e6f7abb6eb75fc1fd84702cadcbc6f4d615f504f4c357"
    url "https://github.com/okteto/okteto/releases/download/1.13.9/okteto-Darwin-arm64"
  else
    sha256 "9837150ee1c2731c7341dfd2f70cd74cef1aa8db73d3b1c0d16f33f5be453e91"
    url "https://github.com/okteto/okteto/releases/download/1.13.9/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.9", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
