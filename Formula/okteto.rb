class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.27.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5bb3e4117b54a08bd08b7a3a4eb65dec78877f0a891092c1fe5e35f11aa2d801"
    url "https://github.com/okteto/okteto/releases/download/2.27.0/okteto-Darwin-arm64"
  else
    sha256 "6b84a76fe097f668b2b7d9510c7bf6269e845c8e420df3c30cfb8b8bb983dab2"
    url "https://github.com/okteto/okteto/releases/download/2.27.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.27.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
