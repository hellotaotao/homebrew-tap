cask "quotaswap" do
  version "0.3.1"
  sha256 "6d11197a3aa9ee491da824a7f13303f4071b1e05aa149c414ba093ab0b7c536e"

  url "https://github.com/hellotaotao/QuotaSwap/releases/download/v#{version}/QuotaSwap-#{version}.dmg"
  name "QuotaSwap"
  desc "Switch Claude desktop accounts and watch each account's usage"
  homepage "https://github.com/hellotaotao/QuotaSwap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "QuotaSwap.app"
  binary "#{appdir}/QuotaSwap.app/Contents/MacOS/QuotaSwap", target: "quotaswap"

  uninstall quit: "au.taotao.quotaswap"

  zap trash: [
    "~/Library/Application Support/Claude-accounts",
    "~/Library/Application Support/QuotaSwap",
    "~/Library/Preferences/au.taotao.quotaswap.plist",
  ]
end
