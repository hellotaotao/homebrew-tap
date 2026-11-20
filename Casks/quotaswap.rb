cask "quotaswap" do
  version "0.3.2"
  sha256 "749edfa91c4e922a3a8e54921bbd2a379e9dad6616510f0f98caceb497b6e03e"

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
