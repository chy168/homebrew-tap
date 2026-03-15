class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.4/mcp-gatekeeper-darwin-arm64"
      sha256 "3aa53daeef200b7b559724a0e59e432137ac31a4e50b744a9fe4b1ff5d7a470a"

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.4/mcp-gatekeeper-darwin-amd64"
      sha256 "391a97de0a34b857261bea028b64200ac40ef9c4e44482d672209828482aa63e"

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.4/mcp-gatekeeper-linux-arm64"
      sha256 "79a7ccd7937f4c3da6abe575f0cb2911dfdd1862dc4535fbc5910610151cb4b7"

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.4/mcp-gatekeeper-linux-amd64"
      sha256 "7fb3dcb968fb01a641c38cf2dfd602307c2a69abc40d69e4c7756d15bb413d03"

      def install
        bin.install "mcp-gatekeeper-linux-amd64" => "mcp-gatekeeper"
      end
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mcp-gatekeeper 2>&1", 1)
  end
end
