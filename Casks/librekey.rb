cask "librekey" do
  version "1.3.0"
  sha256 "f94bb98d9d938574e6b229a4f1fadb95f59d28a9325efb0ece21ca47ed906606"

  url "https://github.com/viethoavnm/LibreKey/releases/download/v#{version}/LibreKey-#{version}-macOS.zip"
  name "LibreKey"
  desc "Vietnamese input method that runs on multi-user Macs"
  homepage "https://github.com/viethoavnm/LibreKey/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # macOS-only, but deliberately no minimum version: LibreKey runs on 10.13+,
  # below every macOS Homebrew still supports, so a floor could never bind - and
  # the symbol for it (:high_sierra) is disabled in Homebrew anyway.
  depends_on :macos

  app "LibreKey.app"

  # The helper is embedded in Contents/Library/LoginItems and enabled through
  # SMLoginItemSetEnabled, so it runs as its own process and needs its own quit.
  uninstall quit: [
    "vn.viethoavnm.librekey",
    "vn.viethoavnm.librekey.Helper",
  ]

  zap trash: [
    "~/Library/Application Support/LibreKey",
    "~/Library/Caches/vn.viethoavnm.librekey",
    "~/Library/HTTPStorages/vn.viethoavnm.librekey",
    "~/Library/Preferences/vn.viethoavnm.librekey.plist",
  ]

  caveats <<~EOS
    LibreKey chưa có chữ ký Developer ID và chưa được Apple công chứng, nên
    macOS gắn cờ cách ly cho bản tải về và chặn ở lần mở đầu tiên. Gỡ cờ:

      xattr -dr com.apple.quarantine /Applications/LibreKey.app

    Sau đó bật LibreKey trong System Settings › Privacy & Security ›
    Accessibility. Trên máy nhiều tài khoản, việc bật này cần quyền quản trị,
    nhưng chỉ cần làm một lần cho /Applications/LibreKey.app.

    Nếu đang dùng bộ gõ khác (kể cả OpenKey gốc), hãy tắt hẳn nó — hai bộ gõ
    cùng chạy sẽ tranh nhau sửa phím.
  EOS
end
