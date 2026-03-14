class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.2/mcp-gatekeeper-darwin-arm64"
      sha256 "53295129d1395f7eed1e346bc022749bce379f7e22d6a0230337c39b2aec1e43"

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.2/mcp-gatekeeper-darwin-amd64"
      sha256 "b90aa58b3476e8adc24b926fc1899b4e4257b6a54d4c5dc298d3347279e91d6c"

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.2/mcp-gatekeeper-linux-arm64"
      sha256 "06a077fedfa813b116c95212e86a50ce00c6ce565451ca95710928cfb7f42aa3"

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.2/mcp-gatekeeper-linux-amd64"
      sha256 "02a4e3fdd7e92a30a0b29e18155365b586b01f72693d71c5e5e0024d75052430"

      def install
        bin.install "mcp-gatekeeper-linux-amd64" => "mcp-gatekeeper"
      end
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mcp-gatekeeper 2>&1", 1)
  end
end
