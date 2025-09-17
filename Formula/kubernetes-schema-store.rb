class KubernetesSchemaStore < Formula
  url "https://github.com/moonlight8978/kubernetes-schema-store/releases/download/v0.1.0/kubernetes-schema-store_darwin_arm64.tar.gz"
  sha256 "e5d0be40fda10ffcac26a7732fb40e8a7220e62709d884d3a45dc8dbac00e5ed"

  homepage "https://github.com/moonlight8978/kubernetes-schema-store"
  desc "Kubernetes Schema Store"
  license "MIT"
  head "https://github.com/moonlight8978/kubernetes-schema-store.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v(\d+\.\d+\.\d+)$/i)
  end

  depends_on arch: :arm64

  def install
    bin.install "kss"
    generate_completions_from_executable(bin/"kss", "completion", shells: [:zsh])
  end

  test do
    assert_equal true, shell_output("#{bin}/kss version").include?("kubernetes")
  end
end
