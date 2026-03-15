class McpGatekeeper < Formula
  desc "Lightweight stdio proxy for filtering MCP server tool lists"
  homepage "https://github.com/chy168/mcp-gatekeeper"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-darwin-arm64"
      sha256 "d0e9a2b5d054f142b2d82e17f6f4128801be963a822e7db8c678faca7e216cc8"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-secret-darwin-arm64"
        sha256 "2fcda29af03202184bb006567c6637c7a019450e51a88136e6cfa4eebd1dc93a"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-darwin-amd64"
      sha256 "01e4fe21fb8c8f7983c9159180597e3a4a5406719f0d8f1e75c3eaf327662848"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-secret-darwin-amd64"
        sha256 "d069c99261e49055e0c1d2963bfaa58c33f245ec67700e152cc00c0ea4e188d4"
      end

      def install
        bin.install "mcp-gatekeeper-darwin-amd64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-darwin-amd64" => "mcp-gatekeeper-secret" }
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-linux-arm64"
      sha256 "993399f3be541a175dbdcb476b59d474929d7276e517d4e8df32a05c88c5135f"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-secret-linux-arm64"
        sha256 "91cd8f0957266ff9fa1bf56474fa5b8436c8abfd1ab6a5065d60382d5ae0fa06"
      end

      def install
        bin.install "mcp-gatekeeper-linux-arm64" => "mcp-gatekeeper"
        resource("mcp-gatekeeper-secret").stage { bin.install "mcp-gatekeeper-secret-linux-arm64" => "mcp-gatekeeper-secret" }
      end
    else
      url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-linux-amd64"
      sha256 "9c847d7aa5d66fa296e38e199ee13a9d9bf5599ebc07d5b994c04cd1eb9197fc"

      resource "mcp-gatekeeper-secret" do
        url "https://github.com/chy168/mcp-gatekeeper/releases/download/v0.0.5/mcp-gatekeeper-secret-linux-amd64"
        sha256 "e5392cc9063129ffea3e9610eb649d1e79ea1be782ad680398db9f256c7da98b"
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
