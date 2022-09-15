class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.7.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f1be451e822e22fac640da912d14058e856f6089bdf8dfae06506a1790b276c0"
    url "https://github.com/okteto/okteto/releases/download/2.7.0/okteto-Darwin-arm64"
  else
    sha256 "3635c080e8bd43edbf3a8db7a5459f82595587d6cc358e79eaa5419cf456a1fe"
    url "https://github.com/okteto/okteto/releases/download/2.7.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.7.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
