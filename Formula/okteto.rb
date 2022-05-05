class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.2.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "fa8455298251da2438479c3a58938a536392d60cbc9155330b9e1837ae09e768"
    url "https://github.com/okteto/okteto/releases/download/2.2.2/okteto-Darwin-arm64"
  else
    sha256 "5a4210db1c23469e349c76f2849882ae82ee4bf6faa7f36489ec3d808a0bc8da"
    url "https://github.com/okteto/okteto/releases/download/2.2.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.2.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
