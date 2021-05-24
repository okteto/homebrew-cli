class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.13"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "432286fef6a434d504d6f8059b006167d39c8cd18266f63ff575690d7918b69b"
    url "https://github.com/okteto/okteto/releases/download/1.12.13/okteto-Darwin-arm64"
  else
    sha256 "483db024df072b367f10ace0353b406d2044dc45ef387797df73f2e70a7f3a9c"
    url "https://github.com/okteto/okteto/releases/download/1.12.13/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.13", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
