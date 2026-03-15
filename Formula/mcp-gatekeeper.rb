class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.3/mcp-gatekeeper-darwin-arm64"
      sha256 "15d25253d649261a8ef5c1b087ca1d3e288af984917d517d2b648f1c6f3413ed"

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.3/mcp-gatekeeper-darwin-amd64"
      sha256 "499eb9f05dc20f022aed7b0d58dbac5df6d57192c3c7043e1dd665b8d44a701b"

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.3/mcp-gatekeeper-linux-arm64"
      sha256 "237a57ab7372423195f13b5eda424814969452ee4fec9e558394ea8724225f15"

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.3/mcp-gatekeeper-linux-amd64"
      sha256 "dfe52ee1d28cc4e3d49359c3242d5faecf3305c6479b61fb2fbade3bdc12e0ec"

      def install
        bin.install "mcp-gatekeeper-linux-amd64" => "mcp-gatekeeper"
      end
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mcp-gatekeeper 2>&1", 1)
  end
end
