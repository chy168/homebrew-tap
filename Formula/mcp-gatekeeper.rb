class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-darwin-arm64"
      sha256 "59b09954e3a94b5a9facd400561e1ee497f1622f3639014b1407ba88ee66a28c"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-secret-darwin-arm64"
        sha256 "973b21f750c5fd391f0ac2f1489e377c7b60fce8ac4cf0194b634cf87e30b48f"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-darwin-amd64"
      sha256 "56cb81195926e9d69550af197eb427cbc1fd7cf79486b67cc5f105f0c04564e1"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-secret-darwin-amd64"
        sha256 "79c73758e91d90334e25538361ef312b25deb13b7e8600898bca1ec616a678d7"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-amd64" => "mcp-gatekeeper-secret" }
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-linux-arm64"
      sha256 "6aa12752435ef99260f4e5e79b60403292ba34c4727124ab725321d32e646388"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-secret-linux-arm64"
        sha256 "4f563f508112e2e74a760814377beb2632a4a40a81e5d810a2959b4fd17cce99"
      end

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-linux-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-linux-amd64"
      sha256 "d5f1c70eb1c5a2b6af53e0cc8a59929d662f2858101276dcd3d7be53e56173a1"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.6/mcp-gatekeeper-secret-linux-amd64"
        sha256 "73e38ff768f1549e9d3642b3726de7bcf001dbde1d69a81cd1d79f0bc7cb2bc0"
      end

      def install
        bin.install "mcp-gatekeeper-linux-amd64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-linux-amd64" => "mcp-gatekeeper-secret" }
      end
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mcp-gatekeeper 2>&1", 1)
    assert_match "Usage:", shell_output("#{bin}/mcp-gatekeeper-secret 2>&1", 1)
  end
end
