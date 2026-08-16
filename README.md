# homebrew-librekey

Homebrew tap cho [LibreKey](https://github.com/viethoavnm/LibreKey) — bộ gõ tiếng
Việt cho macOS, bản phái sinh của [OpenKey](https://github.com/tuyenvm/OpenKey).

## Cài đặt

```sh
brew install --cask viethoavnm/librekey/librekey
```

Hoặc tách làm hai bước:

```sh
brew tap viethoavnm/librekey
brew install --cask librekey
```

Sau khi cài, gỡ cờ cách ly của Gatekeeper rồi bật quyền Accessibility:

```sh
xattr -dr com.apple.quarantine /Applications/LibreKey.app
open /Applications/LibreKey.app
```

Bước gỡ cờ là bắt buộc vì LibreKey ký ad-hoc, chưa có chữ ký Developer ID và
chưa được Apple công chứng (notarize) — cả hai đều cần tài khoản Apple Developer
trả phí. Nếu không muốn tin bản build sẵn, hãy
[build từ mã nguồn](https://github.com/viethoavnm/LibreKey#build).

## Cập nhật

```sh
brew upgrade --cask librekey
```

Vì app ký ad-hoc, macOS gắn quyền Accessibility với chữ ký cụ thể của bản build.
Sau khi nâng cấp, nếu LibreKey không gõ được nữa thì vào *System Settings ›
Privacy & Security › Accessibility*, bỏ LibreKey ra rồi thêm lại.

## Gỡ cài đặt

```sh
brew uninstall --cask librekey          # gỡ app
brew uninstall --zap --cask librekey    # gỡ cả thiết lập và dữ liệu
```

## Vì sao là tap riêng

Homebrew Cask chính thức chỉ nhận app đủ ngưỡng phổ biến (75 sao, hoặc 30 fork,
hoặc 30 watcher). LibreKey chưa đạt, nên tap này là nơi phát hành cho tới khi đủ
điều kiện nộp lên `homebrew/cask`.

## Bảo trì

`Casks/librekey.rb` được cập nhật tự động: workflow `homebrew-bump.yml` bên repo
[LibreKey](https://github.com/viethoavnm/LibreKey) chạy mỗi khi có release mới,
tính lại `sha256` của file `LibreKey-x.y.z-macOS.zip` và đẩy commit sang đây.
Sửa tay chỉ cần khi đổi cấu trúc cask.
