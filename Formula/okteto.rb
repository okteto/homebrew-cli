class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.11.1"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "34031611e74917ce3eab6bec6496806835d3503e996ecf8c39cf30001ac78b7e"
    url "https://github.com/okteto/okteto/releases/download/1.11.1/okteto-Darwin-arm64"
  else
    sha256 "243cadd9ae309b70978505bd62330161a933e64e9b1b3cd24a097fb4e5a522da"
    url "https://github.com/okteto/okteto/releases/download/1.11.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.11.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
