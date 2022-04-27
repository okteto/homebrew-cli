class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.2.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d06ed839d566333e54239d8263f2eb41f46ba7bf00a28c41a90688f5db9e5383"
    url "https://github.com/okteto/okteto/releases/download/2.2.0/okteto-Darwin-arm64"
  else
    sha256 "8d5d97933c93330a9bc7b527eabf108c9a50f4d25ec83b52f870709957149be2"
    url "https://github.com/okteto/okteto/releases/download/2.2.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.2.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
