class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-darwin-arm64"
      sha256 "a6fa5cbe0373c489492076766ee223cd7e3341b82a2557bba68427802fe7db85"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-secret-darwin-arm64"
        sha256 "feca43c58f2ea4728f22ca40a14dcb9880f7c972d1bd6ab5769ac70016ec3a52"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-darwin-amd64"
      sha256 "809375f04071244c64594a9156cd6146765be6f3190b567642115ac4ea0101f6"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-secret-darwin-amd64"
        sha256 "8baf10bf8b16b73872f006eb2c1181658ee0fac551f2325015e4e8ab8bd49f59"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-amd64" => "mcp-gatekeeper-secret" }
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-linux-arm64"
      sha256 "36f1538178e8e9a03a20c2573a9d8b4df09df281f498532910c2b4fd88d1a2e4"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-secret-linux-arm64"
        sha256 "3b7e9dcd4d6468d591250c21826d5d2a9ca9e595a04f789752587a528edf3940"
      end

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-linux-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-linux-amd64"
      sha256 "ef29ac73873a2a56d0aeebea1a98446ded8a8bf87166b33074476b5ad0e03773"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.7/mcp-gatekeeper-secret-linux-amd64"
        sha256 "fe94c34dbdcacb43d18b4cab56af0cd0d46acc1e05ccb97c373140a0241d16ef"
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
