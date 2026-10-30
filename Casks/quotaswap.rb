cask "quotaswap" do
  version "0.2.0"
  sha256 "2f07178ecc86e28268122f697f82fdccfad99506a53ba8c8e2f3894887e95bf1"

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
  ]
end
