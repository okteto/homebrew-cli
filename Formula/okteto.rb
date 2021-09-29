class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ce397464b695bbd156c5e5e175916f39ae43206d0f258cee9cd4b7ca46fab72c"
    url "https://github.com/okteto/okteto/releases/download/1.14.1/okteto-Darwin-arm64"
  else
    sha256 "4c762d9be66cb2fce8fabba12be0a06bb51c3995de4dea071e019404fa0998ab"
    url "https://github.com/okteto/okteto/releases/download/1.14.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
